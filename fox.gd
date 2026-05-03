extends Node3D

func react(state):
	if state == "life": 
		show()
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector3(1.1, 1.1, 1.1), 1.0)
	else:
		var tween = create_tween()
		tween.tween_property(self, "position", Vector3(5, 1, -4), 2.0)
		tween.tween_callback(func(): hide())
