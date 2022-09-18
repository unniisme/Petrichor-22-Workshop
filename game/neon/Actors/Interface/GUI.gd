extends Control


func _on_Play_pressed():
	get_tree().change_scene("res://Levels/Test Level.tscn")


func _on_Quit_pressed():
	get_tree().quit()
