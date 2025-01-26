extends Node3D

# Carga de las escenas
@export var floor_scene: PackedScene = preload("res://escenas/Suelo.tscn")
@export var wall_scene: PackedScene = preload("res://escenas/pared.tscn")
@export var wall_scene_no_canva: PackedScene = preload("res://escenas/pared_vacia.tscn")
@export var Wooden_roof: PackedScene = preload("res://escenas/techoEscena.tscn")
# Número de elementos
@export var num_elements: int = ControladorImagenes.size()

func _ready():
	
	add_elements(num_elements)
	
	
func add_elements(n):
	
	for i in range(int(n/2)):
		add_suelo(Vector3(4+(4*i), 0, 2))
		add_suelo(Vector3(4+(4*i), 0, -2))
		add_techo(Vector3(2+(4*i), 4, 0))
		# Crear y posicionar paredes
		add_bombilla(Vector3(4+(4*i), 2, 0))
		add_pared_con_cuadro(Vector3(4+(4*i), 2, -4),null,null)
		add_pared_con_cuadro(Vector3(4+(4*i), 2, 4) ,Vector3(0,PI,0),null)
		
	if n%2==0:
		add_pared_sin_cuadro(Vector3(2+(4*n/2), 2, 0),Vector3(0,3*PI/2,0),Vector3(8,8.5,4))
	else:
		add_pared_con_cuadro(Vector3((4*n/2),2, 0),Vector3(0,3*PI/2,0),Vector3(2,2.5,1))

		
func add_pared_sin_cuadro(posicion,rotacion,escala):
	var instancia_pared = wall_scene_no_canva.instantiate()
	instancia_pared.position = posicion  # Ajusta la posición como necesites
	if rotacion != null:
		instancia_pared.rotation = rotacion
	if escala != null:
		instancia_pared.get_node("StaticBody3D2").scale = escala
	add_child(instancia_pared)
		
func add_pared_con_cuadro(posicion,rotacion,escala):
	var instancia_pared = wall_scene.instantiate()
	instancia_pared.position =posicion  # Ajusta la posición como necesites
	if rotacion != null:
		instancia_pared.rotation = rotacion
	if escala != null:
		instancia_pared.get_node("StaticBody3D/CollisionShape3D/PARED").scale=escala
		instancia_pared.get_node("StaticBody3D/CollisionShape3D/RODAPIE").scale=Vector3(escala[0],0.036,0.025)
	add_child(instancia_pared)


func add_suelo(posicion):
	var instancia_suelo = floor_scene.instantiate()
	instancia_suelo.position = posicion # Ajusta la posición como necesites
	add_child(instancia_suelo)

func add_techo(posicion):
	var instancia = Wooden_roof.instantiate()
	instancia.position = posicion # Ajusta la posición como necesites
	add_child(instancia)

func add_bombilla(posicion):
	var instancia_luz = OmniLight3D.new()
	instancia_luz.position = posicion # Ajusta la posición como necesites
	instancia_luz.light_energy = 2
	instancia_luz.omni_range=7
	add_child(instancia_luz)
