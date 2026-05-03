extends CharacterBody3D

@export var speed = 5.0
const GRAVITY = -9.8
var near_plant = false
var near_tree = false

func _physics_process(delta):
	var dir = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):
		dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		dir.z += 1
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		dir.x += 1

	velocity.x = dir.normalized().x * speed
	velocity.z = dir.normalized().z * speed
	velocity.y += GRAVITY * delta

	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		var decision = get_node("../WaterDecisionZone")
		if near_plant:
			decision.choose_plant()
		elif near_tree:
			decision.choose_tree()

func dissolve():
	var tween = create_tween()
	tween.tween_property($MeshInstance3D, "transparency", 1.0, 3.0)
	tween.tween_callback(func(): queue_free())
func _ready():
	$Camera3D.top_level = true

func _process(delta):
	var target_pos = global_position + Vector3(0, 4, 7)
	$Camera3D.global_position = $Camera3D.global_position.lerp(target_pos, 0.1)
	$Camera3D.look_at(global_position + Vector3(0, 1, 0), Vector3.UP)
