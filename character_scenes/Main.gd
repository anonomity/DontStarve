extends Spatial


export (NodePath) var camera_path

onready var camera : Camera = get_node(camera_path)

func _physics_process(delta):
	pass
