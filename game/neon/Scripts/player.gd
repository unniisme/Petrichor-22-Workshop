extends KinematicBody2D

export var gravity = 400
export var movementSpeed = 300
export var jumpSpeed = 500

var velocity = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	
	#player velocity
	velocity.y += gravity*delta
	
	# 
	velocity.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	velocity.x = velocity.x*movementSpeed
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= jumpSpeed
	
	
	#Function to move player
	velocity = move_and_slide(velocity, Vector2.UP)
