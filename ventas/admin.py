from django.contrib import admin
from .models import Venta

# Register your models here.

@admin.register(Venta)
class VentaAdmin(admin.ModelAdmin):
    list_display = ('n_venta','fecha_emision', 'tipo_pago','fiado_a','pagado','total_venta',)
    search_fields = ('fecha_emision',)
    list_filter = ('pagado','tipo_pago')