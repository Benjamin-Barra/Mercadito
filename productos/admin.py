from django.contrib import admin
from .models import Categoria, Producto


@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre', 'descripcion')
    list_filter = ('nombre',)
    search_fields = ('nombre', 'descripcion')


@admin.register(Producto)
class ProductoAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre', 'categoria', 'precio', 'stock', 'activo')
    list_display_links = ('id', 'nombre')
    list_filter = ('categoria', 'activo')
    search_fields = ('nombre', 'categoria__nombre')
    list_editable = ('precio', 'stock')