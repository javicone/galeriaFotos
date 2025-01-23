extends Node3D

# Carga de las escenas
@export var floor_scene: PackedScene = preload("res://escenas/Suelo.tscn")
@export var wall_scene: PackedScene = preload("res://escenas/pared.tscn")
@export var wall_scene_no_canva: PackedScene = preload("res://escenas/pared_vacia.tscn")
# Número de elementos
@export var num_elements: int = ControladorImagenes.size()

func _ready():
	
	add_elements(num_elements)
	var environment = Environment.new()
	environment.ambient_light_color = Color(0, 0, 0)  # Gris claro
	environment.ambient_light_energy = 3.0
	var world_env = WorldEnvironment.new()
	world_env.environment = environment
	add_child(world_env)
	
func add_elements(n):
	
	for i in range(int(n/2)):
		
		# Crear y posicionar suelos
		var instancia_suelo = floor_scene.instantiate()
		instancia_suelo.position = Vector3(4+(4*i), 0, 0)  # Ajusta la posición como necesites
		add_child(instancia_suelo)
		print("Pared colocada " ,i)
		# Crear y posicionar paredes
		var instancia_pared_izq = wall_scene.instantiate()
		var instancia_pared_der = wall_scene.instantiate()
		instancia_pared_izq.position = Vector3(4+(4*i), 2, -2)  # Ajusta la posición como necesites
		instancia_pared_der.position = Vector3(4+(4*i), 2, 2)  # Ajusta la posición como necesites
		instancia_pared_der.rotation = Vector3(0,PI,0)
		add_child(instancia_pared_izq)
		add_child(instancia_pared_der)
		print("suelo colocada " ,i)
	if n%2==0:
		var instancia_pared_del_final = wall_scene_no_canva.instantiate()
		instancia_pared_del_final.position = Vector3(2+(4*n/2), 2, 0)  # Ajusta la posición como necesites
		instancia_pared_del_final.rotation = Vector3(0,3*PI/2,0)
		add_child(instancia_pared_del_final)
	else:
		var instancia_pared_del_final = wall_scene.instantiate()
		instancia_pared_del_final.position = Vector3((4*n/2),2, 0)  # Ajusta la posición como necesites
		instancia_pared_del_final.rotation = Vector3(0,3*PI/2,0)
		add_child(instancia_pared_del_final)
		
