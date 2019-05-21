extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -450
const FIREBALL = preload("res://Game/Projectils/FireBall.tscn")
var motion = Vector2()
var limite

var score = 0

func _ready():
	limite = get_viewport_rect().size

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_end"):
		get_tree().change_scene("MainMenu.tscn")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		$AnimatedSprite.play("Idle")
		friction = true
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			Sound_fx.get_node("jump").play()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	if Input.is_action_just_pressed("ui_select"):
		var fireball = FIREBALL.instance()
		Sound_fx.get_node("shoot").play()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.global_position = $Position2D.global_position
	
	
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
	motion = move_and_slide(motion, UP)
	pass

