extends KinematicBody2D

onready var awareness = get_parent().get_node("Guard/CanvasLayer/AWER/TextureProgress")
export var can_move = true
export(int) var speed = 0

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if can_move == true:
		input_vector.x = Input.get_action_strength("d") - Input.get_action_strength("a")
		input_vector.y = Input.get_action_strength("s") - Input.get_action_strength("w")
	input_vector = input_vector.normalized()
	
	if input_vector == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide(input_vector * speed)
		$AnimationTree.set("parameters/Idle/blend_position", input_vector)
		$AnimationTree.set("parameters/Walk/blend_position", input_vector)
	
	if Input.is_action_pressed("ui_page_up"):
		$Camera2D.zoom -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("ui_page_down"):
		$Camera2D.zoom += Vector2(0.01, 0.01)

	if Input.is_action_just_pressed("a"):
		$Heads.scale.x = -1
		$Bodys.scale.x = -0.5
		$Legs.scale.x = -0.5
		$Hats.scale.x = -1

	if Input.is_action_pressed("d") or Input.is_action_pressed("w") or Input.is_action_pressed("s"):
		$Heads.scale.x = 1
		$Bodys.scale.x = 0.5
		$Legs.scale.x = 0.5
		$Hats.scale.x = 1

	if Input.is_action_pressed("w") and Input.is_action_pressed("a"):
		$Heads.scale.x = 1
		$Bodys.scale.x = 0.5
		$Legs.scale.x = 0.5
		$Hats.scale.x = 1

	if Input.is_action_just_pressed("d"):
		$AnimationPlayer2.play("chase_right")
	if Input.is_action_just_pressed("a"):
		$AnimationPlayer2.play("chase_left")
	if Input.is_action_just_pressed("w"):
		$AnimationPlayer2.play("chase_up")
	if Input.is_action_just_pressed("s"):
		$AnimationPlayer2.play("chase_down")
