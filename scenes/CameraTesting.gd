extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var distance = 4.0
export var height = 2.0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_as_toplevel(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3.UP
	var offset = pos - target
	
	offset = offset.normalized() * distance
	offset.y = height
	
	pos = target + offset
	
	look_at_from_position(pos, target, up)
