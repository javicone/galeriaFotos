extends Node

var imagenes = []
var max_imagenes_size = 20
var mutex : Mutex  # Mutex para proteger la cola

# Called when the node enters the scene tree for the first time.
func _ready():
	mutex = Mutex.new()  # Crear el mutex al inicio

# Tamaño de la cola de imágenes
func size():
	return imagenes.size()

# Agrega una imagen a la cola si no ha alcanzado su capacidad máxima
func add_to_queue(item):
	mutex.lock()  # Bloquear el acceso para otros hilos
	if len(imagenes) < max_imagenes_size:
		imagenes.push_back(item)
		print("Imagen agregada a la cola")
	else:
		print("La cola está llena")
	mutex.unlock()  # Desbloquear para permitir que otros hilos accedan

# Elimina el primer elemento de la cola y devuelve si la cola no está vacía
func getElement():
	mutex.lock()  # Bloquear el acceso para otros hilos
	var item = null
	if len(imagenes) > 0:
		item = imagenes.pop_front()  # Obtener el primer elemento
		print("Imagen obtenida de la cola")
	else:
		print("La cola está vacía")
	mutex.unlock()  # Desbloquear para permitir que otros hilos accedan
	return item
