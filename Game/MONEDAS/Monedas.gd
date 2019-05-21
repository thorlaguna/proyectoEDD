extends CanvasLayer

func _process(delta):
	if global_var.monedas > 9:
		$"monedas/1".visible = false
	else:
		$"monedas/1".visible = true
	
	for i in range(2):
		if _cantidad_monedas(global_var.monedas).size() == i:
			return
		get_node("monedas/"+str(i)).frame = int(_cantidad_monedas(global_var.monedas)[i])

func _cantidad_monedas(monedas):
	var str_monedas = str(monedas)
	var numeros = []
	
	for i in range(str_monedas.length()):
		numeros.append(str_monedas[i])
	
	return numeros