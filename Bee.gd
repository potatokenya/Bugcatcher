extends Area2D
export var value = 1


func _on_Bee_body_entered(body):
	if body.name == "Character":
		body.collect_bee(value)
		queue_free()

