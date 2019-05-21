extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var value = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_owner())
	if get_owner() != null:
		get_owner().gears_total += value
	
	get_node("Area2D").connect("body_entered", self, "_collect_gear")
	
	connect("body_enter", self, "_collect_gear")
 # Replace with function body.
func _collect_gear(body):
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
