from django.contrib import admin
from .models import DetalleVenta

# Register your models here.

@admin.register(DetalleVenta)
class DetalleVentaAdmin(admin.ModelAdmin):
    list_display = ('id', 'cantidad','precio_unitario','producto__nombre','venta__n_venta')
    search_fields = ('id',)
    list_filter = ('cantidad',)