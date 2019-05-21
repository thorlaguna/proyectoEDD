extends Node

var monedas = 0

func _process(delta):
	if monedas >= 100:
		monedas = 0