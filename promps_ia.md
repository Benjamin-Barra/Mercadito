# Promps de IA

# PROMP 1 ORIENTADO A base.html

Rol: Eres un Desarrollador Django Senior experto en frontend.

Tarea: Se necesita que hagas un base.html en el cual se pueda contruir la app web sin usar style para aplicar estilos css, teniendo en cuenta que la app web tendrá un diseño de dashboard, es decir, con una nav bar por así decirlo en el lado izquierdo con botones que vayan a las rutas crear_venta pero haciendo referencia al nombre ventas:venta_cre puesto en urls.py, un boton de ir a inicio o ventas:home y que sea responsivo. Además, se utilizará bootstrap para aplicar estilos rapidos. Hay que usar colores como el azul, negro o blanco, colores que sean sobrios pero elegantes.

Contexto: Estoy desarrollando con Django un sistema web para un mercadito familiar, enfocado en control de stock y dinero (CRUD de productos, ventas tipo carrito y resumen de dinero). Es un proyecto de segundo año de Ingeniería en Informática. Mi urls.py tiene la ruta venta_cre para crear venta y home para el inicio. Los templates están en una carpeta templates/ en la raíz del proyecto. Todavía no tengo estilos ni base.html, y quiero usar Bootstrap 5 por CDN.

Formato: Quiero que entregues el codigo del base.html terminado


# Prompt 2: Página de error 404 personalizada

Rol: Eres un Desarrollador Django Senior experto en frontend y en manejo de errores HTTP.

Tarea: Crea una plantilla 404.html personalizada para mi proyecto Django. Debe mostrar el código 404, un mensaje amable que indique que no se encontró lo que el usuario busca y un botón que lo lleve de vuelta al catálogo de productos, usando la ruta con nombre productos:catalogo. Debe extender mi base.html y usar solo clases de Bootstrap, sin etiquetas style ni CSS propio.

Contexto: Estoy desarrollando con Django un sistema web para un mercadito familiar, enfocado en control de stock (CRUD de productos con sus categorías). Es un proyecto de segundo año de Ingeniería en Informática. Mi base.html ya existe, tiene un sidebar a la izquierda, usa Bootstrap 5 por CDN y define los bloques title y content. Mi DetailView de productos devuelve un 404 automático cuando el pk no existe, y quiero que, con DEBUG = False, el usuario vea una página coherente con el resto del sitio y no la pantalla genérica de Django. Los templates están en una carpeta templates/ en la raíz del proyecto.

Formato: Entrega solo el código completo de 404.html, listo para copiar y pegar, y una línea indicando en qué carpeta debe guardarse.

# Prompt 3: Plantilla de detalle de producto

Rol: Eres un Desarrollador Django Senior experto en frontend y en plantillas DTL.

Tarea: Crea una plantilla producto_detalle.html para mostrar el detalle de un producto. Debe mostrar el nombre del producto, su categoría en un badge, el precio con separador de miles, el stock con un badge de color según el nivel (rojo si es 0, amarillo si quedan 5 o menos y verde si hay más), si el producto está activo o inactivo y la fecha de ingreso en formato día/mes/año. Debe incluir un breadcrumb que vuelva al catálogo y un botón para volver, usando la ruta con nombre productos:catalogo. Debe extender mi base.html y usar solo clases de Bootstrap, sin etiquetas style ni CSS propio.

Contexto: Estoy desarrollando con Django un sistema web para un mercadito familiar, enfocado en control de stock. Es un proyecto de segundo año de Ingeniería en Informática. Tengo dos modelos: Categoria (nombre, descripcion, activa) y Producto (nombre, precio, stock, activo, fecha_ingreso y una ForeignKey a Categoria). Mi vista es un DetailView con context_object_name = "producto", y su queryset usa select_related para traer la categoría. La ruta es productos:producto_det y recibe el pk. Mi base.html ya existe, usa Bootstrap 5 y Bootstrap Icons por CDN y define los bloques title y content. Ya tengo django.contrib.humanize en INSTALLED_APPS. Los templates están en una carpeta templates/ en la raíz del proyecto.

Formato: Entrega solo el código completo de producto_detalle.html, listo para copiar y pegar, y una línea indicando en qué carpeta debe guardarse.

# Promp 4: Modificación de plantilla inicio_ventas.html

Rol: Eres un Desarrollador Django Senior experto en frontend y en plantillas DTL.

Tarea: Modifica mi plantilla inicio_ventas.html para convertir la página de inicio en un resumen del negocio. Arriba debe haber tres tarjetas: la caja estimada (con el desglose entre efectivo y tarjeta), las ventas de hoy (con el monto y la cantidad de ventas) y el fiado por cobrar. Debajo debe ir una tabla con las últimas ventas, que muestre el número de venta, la fecha, el tipo de pago (y a quién se fió, si corresponde), los productos con su cantidad, el total y un badge de estado (verde si está pagada y amarillo si está pendiente). Al final debe conservar mi card actual de productos con stock bajo. Todos los montos deben tener separador de miles y se debe mostrar un mensaje cuando no haya ventas. Debe seguir extendiendo mi base.html y usar solo clases de Bootstrap, sin etiquetas style ni CSS propio.

Contexto: Estoy desarrollando con Django un sistema web para un mercadito familiar, enfocado en control de stock y dinero. Es un proyecto de segundo año de Ingeniería en Informática. Mi plantilla actual solo tiene una tabla de productos con stock bajo dentro de una card con cabecera negra, usando el contexto prod_bajo. Mi vista es un ListView de Producto llamada HomeView, y le agregué un get_context_data que envía estas variables: caja, caja_efectivo, caja_tarjeta, fiado_pendiente, hoy_total, hoy_cantidad y ultimas_ventas. La caja suma solo las ventas con pagado=True, y el fiado se cuenta aparte. El modelo Venta tiene los campos n_venta, fecha_emision, tipo_pago (con choices), fiado_a, pagado y total_venta. El modelo DetalleVenta se relaciona con Venta mediante related_name detalles, y tiene cantidad y una ForeignKey a Producto. Mi base.html ya existe, usa Bootstrap 5 y Bootstrap Icons por CDN y define los bloques title y content. Ya tengo django.contrib.humanize en INSTALLED_APPS. Los templates están en una carpeta templates/ en la raíz del proyecto.

Formato: Entrega solo el código completo de inicio_ventas.html, listo para copiar y pegar, con comentarios HTML breves que separen cada sección, y una línea indicando en qué carpeta debe guardarse.

