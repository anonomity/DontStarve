extends StaticBody


onready var sprite = $Sprite3D

var is_selected = false

func _physics_process(delta):
	if(Input.is_action_just_pressed("rotate_camera_right")):
		#global_transform.rotated(Vector3())
		global_rotate(Vector3(0,1,0), PI/4)
	if(Input.is_action_just_pressed("rotate_camera_left")):
		global_rotate(Vector3(0,1,0), -PI/4)

