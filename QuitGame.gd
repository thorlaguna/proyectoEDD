extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_QuitGame_pressed():
	get_tree().quit()


func _on_QuitGame_focus_entered():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	Sound_fx.get_node("exit").play()
	player.play()


func _on_QuitGame_mouse_entered():
	set_modulate(mouse_over) # Replace with function body.
	set_scale(Vector2(1.1, 1))
	pass # Replace with function body.


func _on_QuitGame_mouse_exited():
	set_modulate(mouse_out) # Replace with function body.
	set_scale(Vector2(1, 1))
	pass # Replace with function body.
