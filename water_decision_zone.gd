extends Node3D

var state = "none"

func choose_plant():
	if state != "none":
		return
	state = "life"
	get_node("../Plant").interact()
	apply_world_change()

func choose_tree():
	if state != "none":
		return
	state = "stability"
	get_node("../Tree").interact()
	apply_world_change()

func apply_world_change():
	var env = get_node("../WorldEnvironment")
	if env == null:
		return
	if state == "life":
		env.environment.adjustment_saturation = 1.5
	else:
		env.environment.adjustment_saturation = 0.3
