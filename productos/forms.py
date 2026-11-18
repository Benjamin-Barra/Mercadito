from django import forms
from .models import Producto

class CrearProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ("nombre","categoria", "precio", "stock")
        labels = {
            "nombre" : "Nombre del Producto",
            "precio" : "Precio del Producto",
            "stock" : "Stock Disponible"
        }
        
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name == "categoria":
                clase = "form-select"
            elif name == "activo":
                clase = "form-check-input"
            else:
                clase = "form-control"
            field.widget.attrs.setdefault("class", clase)