extends Area2D

onready var root = $"/root/Score"

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Score.add_score(Score.score)
			Score.score += 1
			Sound_fx.get_node("coin_collect").play()
			queue_free()