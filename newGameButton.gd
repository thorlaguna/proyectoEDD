extends Button

export (Color, RGB) var mouse_out
export (Color, RGB) var mouse_over

onready var root = $"/root/Score"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene('res://Game/World.tscn') # Replace with function body.
	#Score.add_score(0)
	Score.score -= Score.score - 1
func _on_NewGameButton_focus_entered():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	Sound_fx.get_node("new_game").play()
	player.play()


func _on_NewGameButton_mouse_entered():
	set_modulate(mouse_over) # Replace with function body.
	set_scale(Vector2(1.1, 1))
	pass



func _on_NewGameButton_mouse_exited():
	set_modulate(mouse_out) # Replace with function body.
	set_scale(Vector2(1, 1))
	pass # Replace with function body.
