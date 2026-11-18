from django.db import models
import uuid


class Venta(models.Model):
    
    class TipoPago(models.TextChoices):
        DEBITO_CREDITO = 'TARJETA', 'Débito/Crédito'
        EFECTIVO = 'EFECTIVO', 'Efectivo'
        FIADO = 'FIADO', 'Fiado'
    
    n_venta = models.AutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    fecha_emision = models.DateTimeField(auto_now_add=True)
    
    tipo_pago = models.CharField(max_length=10, choices=TipoPago.choices)
    fiado_a = models.CharField(max_length=150, blank=True)
    pagado = models.BooleanField(default=True)
    
    total_venta = models.PositiveIntegerField(default=0, verbose_name='Total Venta')
    
    def __str__(self):
        return f'Venta #{self.n_venta}'
