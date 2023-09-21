extends Area2D


func _on_Flag_body_entered(body):
	print(str(body.name))
	if body.name == "Character":
		print("body hit player")
		get_tree().change_scene("You_win.tscn")
