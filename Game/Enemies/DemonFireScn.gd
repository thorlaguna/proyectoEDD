extends KinematicBody2D

const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

var is_dead = false

func _ready():
	pass

func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	$AnimatedSprite.play("dead")
	Sound_fx.get_node("die").play()
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		$AnimatedSprite.play("walk")
		
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	if $RayCast2D.is_colliding() == false:
			direction = direction * -1
			$RayCast2D.position.x *= -1

func _on_Timer_timeout():
	 queue_free()# Replace with function body.


func _on_KinematicBody2D_tree_entered(body):
	if "res://Player.tscn" in "res://Game/Enemies/DemonFireScn.tscn":
		print("D")
		get_tree().change_scene("res://Game/youdiedscene.tscn")
