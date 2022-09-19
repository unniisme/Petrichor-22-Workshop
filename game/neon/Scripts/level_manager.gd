extends Node2D

var score=0

# Called when the node enters the scene tree for the first time.
func _ready():
	var get_enemy_all=get_parent().get_node("all_enemies")
	for xx in get_enemy_all.get_children():
		var enemy_area=xx.get_node("Enemy/Area2D")
		enemy_area.connect("body_entered", self, "enemy_player_area_entered")


func enemy_player_area_entered(body):
	if(body.name=="Player"):
		get_tree().change_scene("res://Actors/Interface/GUI.tscn")
		print("Final Score: ", score)
	
	

func _on_killer_area_body_entered(body):
	if(body.name=="Player"):
		get_tree().change_scene("res://Actors/Interface/GUI.tscn")
		print("Final Score: ", score)
	



func _on_Coin_body_entered(body):
	if(body.name=="Player"):
		score=score+1
		print("new _score : ", score)
		
		#Only works for 4 coins of course
		if score == 4:
			print("DONE!")

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
