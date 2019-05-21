extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	



func _on_Stage_3_pressed():
	get_tree().change_scene("res://World3.tscn")


func _on_Stage_3_focus_entered():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://Music/Sound/Sound_Effects/INTERFACE-BUTTON-CLICKS-UI/Retro_8-Bit_Game-Interface_UI_15.wav")
	player.play()
