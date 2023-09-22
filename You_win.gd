extends Node2D
onready var timer = get_node("Timer1")
onready var ezpz = $ezpz

var seconds = 5

func _ready():
	$ezpz.play()
	timer.set_wait_time(1.1)
	
	timer.start()
	

func _on_Timer1_timeout():
	seconds -= 1
	
	get_node("Time1").set_text(str(seconds))
	
	if seconds == -1:
	
		get_tree().change_scene("MainScene.tscn")
