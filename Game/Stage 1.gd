extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, FILE, "*.tscn") var next_world
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_pressed():
	get_tree().change_scene(next_world)


func _on_Stage_1_focus_entered():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Music/Sound/Sound_Effects/INTERFACE-BUTTON-CLICKS-UI/Retro_8-Bit_Game-Interface_UI_15.wav")
	player.play()
