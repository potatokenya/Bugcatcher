extends Area2D
export var value = 1
onready var bee=$buzz

var hasgot = false

func _on_Bee_body_entered(body):
	if body.name == "Character" and not hasgot:
		hasgot = true
		bee.play()
		body.collect_bee(value)
		hide()
		
		yield(get_tree().create_timer(bee.stream.get_length()), "timeout")
		queue_free()
