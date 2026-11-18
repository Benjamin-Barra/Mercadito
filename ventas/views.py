from django.contrib import messages
from django.db.models import Sum, Count, Q
from django.utils import timezone
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db import transaction
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView

from productos.models import Producto
from .forms import CrearVentaForm, DetalleFormSet
from .models import Venta


class HomeView(ListView):
    model = Producto
    template_name = 'inicio_ventas.html'
    context_object_name = 'prod_bajo'

    def get_queryset(self):
        return Producto.objects.filter(stock__lt=5).order_by('stock', 'nombre')
    
    def get_context_data(self, **kwargs):
        contexto = super().get_context_data(**kwargs)
        hoy = timezone.localdate()

        resumen = Venta.objects.aggregate(
            caja=Sum('total_venta', filter=Q(pagado=True)),
            efectivo=Sum('total_venta', filter=Q(pagado=True, tipo_pago=Venta.TipoPago.EFECTIVO)),
            tarjeta=Sum('total_venta', filter=Q(pagado=True, tipo_pago=Venta.TipoPago.DEBITO_CREDITO)),
            fiado=Sum('total_venta', filter=Q(pagado=False)),
            hoy_total=Sum('total_venta', filter=Q(fecha_emision__date=hoy)),
            hoy_cantidad=Count('pk', filter=Q(fecha_emision__date=hoy)),
        )

        contexto['caja'] = resumen['caja'] or 0
        contexto['caja_efectivo'] = resumen['efectivo'] or 0
        contexto['caja_tarjeta'] = resumen['tarjeta'] or 0
        contexto['fiado_pendiente'] = resumen['fiado'] or 0
        contexto['hoy_total'] = resumen['hoy_total'] or 0
        contexto['hoy_cantidad'] = resumen['hoy_cantidad']

        contexto['ultimas_ventas'] = (
            Venta.objects.prefetch_related('detalles__producto')
            .order_by('-fecha_emision')[:5]
        )
        return contexto

class VentaCreateView(LoginRequiredMixin, CreateView):
    model = Venta
    form_class = CrearVentaForm
    template_name = 'crear_venta.html'
    success_url = reverse_lazy('ventas:home')

    def get_context_data(self, **kwargs):
        contexto = super().get_context_data(**kwargs)
        if self.request.method == 'POST':
            contexto['formset'] = DetalleFormSet(self.request.POST)
        else:
            contexto['formset'] = DetalleFormSet()
        return contexto

    def form_valid(self, form):
        formset = self.get_context_data()['formset']
        if not formset.is_valid():
            return self.form_invalid(form)

        with transaction.atomic():
            venta = form.save(commit=False)
            venta.pagado = venta.tipo_pago != Venta.TipoPago.FIADO
            venta.save()

            formset.instance = venta
            detalles = formset.save(commit=False)

            total = 0
            for d in detalles:
                d.precio_unitario = d.producto.precio
                d.save()

                d.producto.stock -= d.cantidad
                d.producto.save()

                total += d.subtotal

            venta.total_venta = total
            venta.save()

        self.object = venta
        messages.success(self.request, 'Venta creada con éxito')
        return HttpResponseRedirect(self.get_success_url())
    
