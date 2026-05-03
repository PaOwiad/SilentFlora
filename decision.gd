extends Node3D

var state = "none"

func choose_plant():
	if state != "none":
		return
	state = "life"
	get_node("../Plant").interact()
	apply_world_change()
	print("Fuchs reagiert: " + state)
	get_node("../Fox").react(state)

func choose_tree():
	if state != "none":
		return
	state = "stability"
	get_node("../Tree").interact()
	apply_world_change()
	print("Fuchs reagiert: " + state)
	get_node("../Fox").react(state)

func apply_world_change():
	var env = get_node("../WorldEnvironment")
	if env == null:
		print("WorldEnvironment nicht gefunden!")
		return
	if state == "life":
		print("Welt wird grüner")
		env.environment.adjustment_saturation = 1.5
	else:
		print("Welt wird grauer")
		env.environment.adjustment_saturation = 0.3
	await get_tree().create_timer(5.0).timeout
	get_node("../Player").dissolve()
