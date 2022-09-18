extends KinematicBody2D

export var gravity = 400
export var movementSpeed = 300
export var jumpSpeed = 500

var spriteOffset = 11

var velocity = Vector2.ZERO

var animatedSprite


func _flip():
	animatedSprite.flip_h = not animatedSprite.flip_h
	animatedSprite.offset.x = -animatedSprite.offset.x
	


func _ready():
	animatedSprite = $AnimatedSprite
	
func _physics_process(delta):
	
	# player velocity
	velocity.y += gravity*delta
	
	# Capture input and update x velocity accordingly
	velocity.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	velocity.x = velocity.x*movementSpeed
	
	# Jumping if player is on the floor
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y -= jumpSpeed
		
	# Jump relese
	if Input.is_action_just_released("Jump"):
		velocity.y = 0 if velocity.y<0 else velocity.y
	
	#Function to move player
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#------------------------------------------
	# Animations
	if velocity.y != 0:
		animatedSprite.play("Jump")
	else:
		if velocity.x == 0:
			animatedSprite.play("idle")
		else:
			animatedSprite.play("run")
	
	# Flipping
	if (velocity.x > 0 and animatedSprite.flip_h) or  (velocity.x < 0 and not animatedSprite.flip_h):
		_flip()
