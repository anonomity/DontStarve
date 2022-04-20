extends KinematicBody



export(int) var speed = 5
var acceleration = 20
var gravity = 20
var jump = 10
var full_contact = false
var ammo = 10
var mouse_sensitivity = 0.2

var air_acceleration = 1
var normal_acceleration = 6

var direction = Vector3()
var velocity = Vector3()
var movement = Vector3()
var fall = Vector3()
var gravity_vec = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):

	direction = Vector3()
	
	if not is_on_floor():
		gravity_vec += Vector3.DOWN * gravity * delta
		acceleration = air_acceleration
	elif is_on_floor() and full_contact:
		gravity_vec = -get_floor_normal()* gravity
		acceleration = normal_acceleration 
	else: 
		gravity_vec = -get_floor_normal()
		acceleration = normal_acceleration 
		
	
	if(Input.is_action_just_pressed("rotate_camera_right")):
		global_rotate(Vector3(0,1,0), PI/4)
	if(Input.is_action_just_pressed("rotate_camera_left")):
		global_rotate(Vector3(0,1,0), -PI/4)
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	direction = direction.normalized()
	
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	
	movement.z = velocity.z + gravity_vec.z
	movement.x = velocity.x + gravity_vec.x
	movement.y = gravity_vec.y
	
	
	velocity = move_and_slide(velocity, Vector3.UP )
	move_and_slide(movement, Vector3.UP)
		
