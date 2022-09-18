#Readme is used for the current code

extends Node2D

func _ready():
	pass # Replace with function body.


func _on_killer_area_body_entered(body):
	if(body.name=="Player"):
		get_tree().reload_current_scene()
