extends Node

var pantallaCarga: PackedScene =  preload("res://escenas/pantallaCarga.tscn")
var escenario: PackedScene = preload("res://escenas/escenario.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Función para cambiar a la pantalla de carga
func cargarPantallaCarga():
	#change_scene(pantallaCarga)
	get_tree().change_scene_to_file("res://escenas/pantallaCarga.tscn")
# Función genérica para cambiar de escena

# Función para cambiar a la pantalla de carga
func cargarGaleria():
	#change_scene(pantallaCarga)
	get_tree().change_scene_to_file("res://escenas/escenario.tscn")
# Función genérica para cambiar de escena



func cambiar_escena_con_transicion():
	# Aquí podrías mostrar una pantalla de carga o una animación
	get_tree().change_scene_to_packed(escenario)
	# Después podrías ocultar la pantalla de carga o la animación



func _on_pantalla_carga_iniciar_galeria():
	cambiar_escena_con_transicion()
