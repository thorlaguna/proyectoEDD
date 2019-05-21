extends KinematicBody2D

onready var timer = $Timer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ICEBALL = preload("res://Game/Enemies/Iceball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	var iceball = ICEBALL.instance() # Replace with function body.
	if sign($Position2D.position.x) == 1:
		iceball.set_fireball_direction(1)
	else:
		iceball.set_fireball_direction(-1)
	get_parent().add_child(iceball)
	iceball.global_position = $Position2D.global_position
	#$AnimatedSprite.play("attack")
