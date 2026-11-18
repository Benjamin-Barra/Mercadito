from django import forms
from django.forms import inlineformset_factory, BaseInlineFormSet
from .models import Venta
from productos_llevar.models import DetalleVenta
from productos.models import Producto


class DetalleVentaForm(forms.ModelForm):
    class Meta:
        model = DetalleVenta
        fields = ("producto", "cantidad")
        widgets = {
            "producto": forms.Select(attrs={"class": "form-select"}),
            "cantidad": forms.NumberInput(attrs={"class": "form-control", "min": 1}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # solo productos con stock
        self.fields["producto"].queryset = Producto.objects.filter(stock__gt=0)

class BaseDetalleFormSet(BaseInlineFormSet):
    def clean(self):
        super().clean()
        vistos = set()
        for form in self.forms:
            if not form.cleaned_data or form.cleaned_data.get("DELETE"):
                continue
            producto = form.cleaned_data.get("producto")
            cantidad = form.cleaned_data.get("cantidad")

            if producto in vistos:
                raise forms.ValidationError(
                    f"{producto} está repetido. Suma la cantidad en una sola fila."
                )
            vistos.add(producto)

            if producto and cantidad and cantidad > producto.stock:
                form.add_error("cantidad", f"Solo quedan {producto.stock} en stock.")


DetalleFormSet = inlineformset_factory(
    Venta, DetalleVenta,
    form=DetalleVentaForm,
    formset=BaseDetalleFormSet,
    extra=0,
    can_delete=True,
    min_num=1,
    validate_min=True,
)

class CrearVentaForm(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ("tipo_pago", "fiado_a")
        labels = {
            "tipo_pago": "Tipo de Pago",
            "fiado_a": "Persona Fiado",
        }
        widgets = {
            "tipo_pago": forms.Select(attrs={"class": "form-select"}),
            "fiado_a": forms.TextInput(attrs={"class": "form-control"}),
        }

    def clean(self):
        datos = super().clean()
        tipo = datos.get("tipo_pago")
        fiado_a = datos.get("fiado_a")

        if tipo == Venta.TipoPago.FIADO and not fiado_a:
            self.add_error("fiado_a", "Indica a quién se le fía.")
        if tipo != Venta.TipoPago.FIADO:
            datos["fiado_a"] = ""
        return datos