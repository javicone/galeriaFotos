extends Camera3D


@export var sensitivity: float = 0.2
var x_rotation: float
var y_rotation: float


func _input(event):
	if event is InputEventMouseMotion:
		x_rotation += -event.relative.y * sensitivity
		rotate_y(deg_to_rad(-event.relative.x * sensitivity))

func _process(_delta):
	x_rotation = clampf(x_rotation, -80, 80)
	rotation_degrees.x = x_rotation
