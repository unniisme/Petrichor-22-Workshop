extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var patrol_path

var patrol_points
var patrol_index=0
var velocity=Vector2.ZERO
export var move_speed=30
# Called when the node enters the scene tree for the first time.
func _ready():
	patrol_points = get_parent().curve.get_baked_points()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = patrol_points[patrol_index]
	var dist=position.distance_to(target)
	if dist < 1:
		patrol_index = wrapi(patrol_index + 1, 0, patrol_points.size())
		target = patrol_points[patrol_index]
	velocity = (target - position).normalized() * move_speed
	velocity = move_and_slide(velocity)

