extends Area2D
onready var shoe=$shoe
var hasgot = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Shoes_body_entered(body):
	if body.name=="Character" and not hasgot:
		hasgot=true
		body.get_child(1).visible=true
		body.get_child(2).visible=false
		body.jumpForce=650
		shoe.play()
		hide()
		
		yield(get_tree().create_timer(shoe.stream.get_length()), "timeout")
		queue_free()

