extends Node3D
@export var max_dimension: float = 0 # 1x1 en unidades 3D
var imagen: Image
@onready var cuadro = $StaticBody3D/CollisionShape3D/cuadro

# This will be called when the node enters the scene
func _ready():
	getImagenGaleria()  # Llama directamente a la función para obtener y mostrar la imagen

# Función para obtener y mostrar la imagen
func getImagenGaleria():
	# Aquí debes obtener la imagen (sustituir esto por tu método real)
	imagen = ControladorImagenes.getElement()


	if imagen != null:
		var foto = ImageTexture.create_from_image(imagen)
		var material = StandardMaterial3D.new()
		var ancho_x = foto.get_width()
		var ancho_y = foto.get_height()
		
		ajustaTamañoMarco(ancho_x,ancho_y)
		material.albedo_texture = foto

		cuadro.material_overlay = material  # Aplica la textura al objeto 3D
		print("Imagen mostrada")
	else:
		print("No se pudo obtener la imagen")

# Función para redimensionar la imagen y ajustar el tamaño del marco
func ajustaTamañoMarco(ancho_imagen, alto_imagen):
	print(max_dimension)
	var escala_x = 0 
	var escala_y = 0
	# Calcula la relación de aspecto de la imagen
	var aspect_ratio = float(ancho_imagen) / float(alto_imagen)
	
	# Si la imagen es más ancha que alta, ajustamos el ancho
	if aspect_ratio > 1:
		# Escalamos el ancho para que no sea mayor a 1 unidad
		escala_x = min(ancho_imagen, max_dimension)
		escala_y = escala_x / aspect_ratio  # Mantenemos la relación de aspecto
	else:
		# Si la imagen es más alta que ancha, ajustamos la altura
		escala_y = min(alto_imagen, max_dimension)
		escala_x = escala_y * aspect_ratio  # Mantenemos la relación de aspecto
	
	# Establece la escala final en el mesh
	cuadro.scale = Vector3(escala_x, escala_y, 1)  # Solo ajusta X e Y
