from django.db import models
from django.core.validators import MinValueValidator

from productos.models import Producto
from ventas.models import Venta

import uuid

class DetalleVenta(models.Model):
    
    id = models.AutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    
    producto = models.ForeignKey(
        Producto, on_delete=models.PROTECT, db_column='producto_id', related_name='detalles'
    )

    venta = models.ForeignKey(
        Venta, on_delete=models.CASCADE, db_column='venta_id',related_name='detalles'
    )
    
    cantidad = models.PositiveIntegerField(validators=[MinValueValidator(1)])
    precio_unitario = models.PositiveIntegerField()
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=["venta", "producto"], name="unico_producto_por_venta")
        ]
    
    @property
    def subtotal(self):
        return self.cantidad * self.precio_unitario

    def __str__(self):
        return f"{self.cantidad} x {self.producto} (venta {self.venta_id})"
