extends Area2D
export var speed : int = 100
export var moveDist : int = 50

onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

onready var kill=$kill

func _physics_process (delta):
	# move to the "targetX" position
	position.x = move_to(position.x, targetX, speed * delta)
	
	# if we're at our target, move in the other direction
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

# moves "current" towards "to" in an increment of "step"
func move_to (current, to, step):
	
	var new = current
	
	# are we moving positive?
	if new < to:
		new += step
		
		if new > to:
			new = to
	# are we moving negative?
	else:
		new -= step
		
		if new < to:
			new = to
			
	return new



#func _on_Ant_body_exited(body):
	#if body.name == "Player":
		#print("body hit player")
		#body.health = body.health - 1
		#body.TakeDamage(); 
		#var player = get_parent().get_parent().get_node("Character/Charater")
		#player.health -= 1
		#player.TakeDamage()
		#queue_free()


func _on_Ant_body_entered(body):
	#print(str(body.name))
	if body.name == "Character":
		print("body hit player")
		body.health = body.health - 1
		body.TakeDamage(); 
		
		if position.x > body.position.x:
			body.position.x -= 100
			body.vel.y -= 100
			
		if position.x < body.position.x:
			body.position.x += 100
			body.vel.y -= 100
		
		#queue_free()





func _on_kbLeft_body_entered(body):
	if body.name == "Character":
		print("skubbet væk")
		body.position.x -= 100
		body.position.y -= 100
