extends Area2D

const SPEED = 750
var velocity = Vector2()
var direction = 1

func _ready():
	pass 

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_DragonFire_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene("res://Game/youdiedscene.tscn")
	queue_free()
