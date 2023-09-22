extends Camera2D

onready var player = get_node("/root/MainScene/Character")

func _process(delta):
# tracks the player along the x axis
	position.x = player.position.x
	
	
	position.y = player.position.y
	
	
