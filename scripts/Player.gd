extends KinematicBody

var camera
var character
var gravity = Vector3.DOWN * 12
var speed = 10
var velocity = Vector3()
var jump = false

func get_input():
	velocity.x = 0
	velocity.z = 0
	
	if (Input.is_action_pressed("move_forward")):
		velocity.z -= speed
	if (Input.is_action_pressed("move_backward")):
		velocity.z += speed
	if (Input.is_action_pressed("move_left")):
		velocity.x -= speed
	if (Input.is_action_pressed("move_right")):
		velocity.x += speed
	


# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_node(".")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera = get_node("Target/Camera").get_global_tranfsorm()

	velocity += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector3.UP)
