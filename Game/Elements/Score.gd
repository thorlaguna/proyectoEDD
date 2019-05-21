extends Node2D

var score = 1

func add_score(score):
	$ScoreHUD/Score.text = str(score)
	score += 1
	print(score)