from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, DetailView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin

from .forms import CrearProductoForm
from .models import Producto


class ProductoListView(ListView):
    model = Producto
    template_name = 'catalogo.html'
    context_object_name = 'catalogo'   
    ordering = ['nombre']
    queryset = Producto.objects.select_related('categoria').order_by('nombre')


class ProductoCreateView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Producto
    form_class = CrearProductoForm
    template_name = 'crear_producto.html'
    success_url = reverse_lazy('productos:catalogo')
    success_message = 'Producto creado con éxito'
    
class ProductoDetailView(DetailView):
    model = Producto
    template_name = 'producto_detalle.html'
    context_object_name = 'producto'
    queryset = Producto.objects.select_related('categoria')
    
class ProductoUpdateView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = Producto
    form_class = CrearProductoForm
    template_name = 'crear_producto.html'
    success_url = reverse_lazy('productos:catalogo')
    success_message = 'Producto actualizado con éxito'


class ProductoDeleteView(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = Producto
    template_name = 'producto_confirmar_eliminar.html'
    context_object_name = 'producto'
    success_url = reverse_lazy('productos:catalogo')
    success_message = 'Producto eliminado con éxito'