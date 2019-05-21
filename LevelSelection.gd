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


func _on_LevelSelection_pressed():
	get_tree().change_scene("res://Game/LevelSelectScn.tscn")
	Score.score -= Score.score - 1


func _on_LevelSelection_focus_entered():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Music/Sound/Sound_Effects/INTERFACE-BUTTON-CLICKS-UI/Retro_8-Bit_Game-Interface_UI_15.wav")
	player.play()


func _on_LevelSelection_mouse_entered():
	set_modulate(mouse_over) # Replace with function body.
	set_scale(Vector2(1.1, 1))
	pass # Replace with function body.


func _on_LevelSelection_mouse_exited():
	set_modulate(mouse_out) # Replace with function body.
	set_scale(Vector2(1, 1))
	pass # Replace with function body.
