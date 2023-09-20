extends KinematicBody2D
# stats
var score = 0

# physics
const speed = 200
const jumpForce = 600
const gravity  = 800

var vel = Vector2(0,0)
var grounded = false

var health = 4


# components
onready var sprite = $Character
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

func _ready():
	pass

func _physics_process(delta):
	# reset horizontal velocity
	vel.x = 0

	# movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed

	# applying the velocity
	vel = move_and_slide(vel, Vector2.UP)

	# gravity
	vel.y += gravity * delta

	# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	# sprite direction
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

func TakeDamage():
	print("TakeDamage")
	if (health == 3):
		$"../CanvasLayer/UI".get_child(4).hide()
		
	if (health == 2):
		$"../CanvasLayer/UI".get_child(3).hide()
	
	if (health == 1):
		$"../CanvasLayer/UI".get_child(2).hide()
		queue_free()

func die():
	get_tree().reload_current_scene()

func collect_bee (value):
	score += value
	ui.set_score_text(score)
