extends AudioStreamPlayer
const tracks = ['Stage1_Loop', 'Stage2_Loop', 'Stage3_Loop', 'Stage4_Loop' , 'Stage5_Loop']

func _ready():
	randomize()
# warning-ignore:return_value_discarded
	connect("finished" ,self, "play_random_song")
	play_random_song()
func play_random_song():
	randomize()
	var rand_nb = randi() % tracks.size()
	var audiostream = load('res://Music/Sound/OST/'+ tracks[rand_nb] + '.wav')
	set_stream(audiostream)
	play()