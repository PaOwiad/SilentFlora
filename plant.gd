extends Node3D

var activated = false

func interact():
	if activated:
		return
	activated = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector3(1.4, 1.4, 1.4), 0.5)


func _on_interact_zone_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.near_plant = true

func _on_interact_zone_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		body.near_plant = false
