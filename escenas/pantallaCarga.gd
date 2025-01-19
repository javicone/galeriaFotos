
extends Node
@onready var file_dialog = $FileDialog
@onready var label = $LoadFileButton/Label
@onready var enter_galery = $EnterGalery
signal iniciarGaleria()


# Called when the node enters the scene tree for the first time.
func _ready():
	file_dialog.current_dir = "/"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_load_file_button_pressed():
	file_dialog.visible=true


func _on_file_dialog_files_selected(paths):
	for i in range(paths.size()):
		var image = Image.load_from_file(paths[i])
		# Optionally, generate mipmaps if displaying the texture on a 3D surface
		# so that the texture doesn't look grainy when viewed at a distance.
		image.generate_mipmaps()
		#image.save_png("/path/to/file.png")
		ControladorImagenes.add_to_queue(image)
		# Save the loaded Image to a PNG image.
	label.set_text(("Imagenes cargadas: " + str(paths.size())))
	print("imagenes agregadas")
	if ControladorImagenes.size()>0 :
		enter_galery.disabled = false
	

func _on_enter_galery_button_up():
	iniciarGaleria.emit()
	
