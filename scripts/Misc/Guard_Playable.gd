extends KinematicBody2D

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
