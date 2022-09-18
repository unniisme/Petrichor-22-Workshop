extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_killer_area_body_entered(body):
	if(body.name=="Player"):
		get_tree().reload_current_scene()
	


var score=0

func _on_Coin_body_entered(body):
	if(body.name=="Player"):
		score=score+1
		print("new _score : ", score)

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
