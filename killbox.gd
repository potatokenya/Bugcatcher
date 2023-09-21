extends Area2D


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(str(body.name))
	if body.name == "Character":
		print("body hit player")
		get_tree().change_scene("Game_over.tscn")
		#body.health == 1
		#body.TakeDamage(); 
		#queue_free()
