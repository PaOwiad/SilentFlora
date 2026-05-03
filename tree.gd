extends Node3D

var stabilized = false

func interact():
	if stabilized:
		return
	stabilized = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector3(1.3, 1.3, 1.3), 0.5)

func _on_interact_zone_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.near_tree = true

func _on_interact_zone_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		body.near_tree = false
