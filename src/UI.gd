extends Control

onready var scoreText = get_node("ScoreText")

func set_score_text (score):
	scoreText.text = str(score,"/3")

func _ready ():
	scoreText.text = "0/3"
