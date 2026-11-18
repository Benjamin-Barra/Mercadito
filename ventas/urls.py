from django.urls import path
from . import views

app_name = "ventas"

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('crear_venta/', views.VentaCreateView.as_view(), name='venta_cre')
]