from django.urls import path
from . import views


app_name = "productos"

urlpatterns = [
    path('', views.ProductoListView.as_view(), name='catalogo'),
    path('/crear_producto/', views.ProductoCreateView.as_view(), name='producto_cre'),
    path('detalle_producto/<int:pk>/', views.ProductoDetailView.as_view(), name='producto_det'),
    path('editar/<int:pk>/', views.ProductoUpdateView.as_view(), name='producto_edit'),
    path('eliminar/<int:pk>/', views.ProductoDeleteView.as_view(), name='producto_del'),
]