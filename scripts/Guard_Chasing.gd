extends KinematicBody2D

var shake_amount = 3.0
export var mode = 1
export(int) var speed = 100
export(int) var speeed = -200
onready var paz: Line2D = get_parent().get_node("Line2D")
onready var obj: KinematicBody2D = get_parent().get_node("Animatronic")
onready var cam = get_parent().get_node("Animatronic/Camera2D")
onready var nav: Navigation2D = get_parent().get_node("Level")
var path : = PoolVector2Array()
var durability = 100
var durability_minus = false

func _ready() -> void:
	speed = get_parent().get_node("Animatronic").speed
	pass

func _process(delta):

	if (durability_minus):
		durability -= 3
		cam_shake()

	if mode == 0:
		$CanvasLayer/ESS.hide()
		$CanvasLayer/static.hide()

	if mode == 1:
		move(delta)
		$CanvasLayer/ESS.show()
		$CanvasLayer/ESS.text = "exoskeleton strength: " + str (durability) + "%"
	
	if durability < 0 and durability > -10:
		get_parent().get_node("Animatronic").can_move = false
		get_parent().get_node("Lose_Screen/Control/am").hide()
		get_parent().get_node("Lose_Screen/AnimationPlayer").play("lose")
		get_parent().get_node("Countdown").lock_lock = true
	pass

func move(delta):
	# Calculate the movement distance for this frame
	var distance_to_walk = speed * delta
	
	# Move the player along the path until he has run out of movement or the path ends.
	while distance_to_walk > 0 and path.size() > 0:
		var distance_to_next_point = position.distance_to(path[0])
		if distance_to_walk <= distance_to_next_point:
			# The player does not have enough movement left to get to the next point.
			position += position.direction_to(path[0]) * distance_to_walk
		else:
			# The player get to the next point
			position = path[0]
			path.remove(0)
		# Update the distance to walk
		distance_to_walk -= distance_to_next_point

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	var dir = position.direction_to(obj.position) * speed
	var velocity = (obj.global_position - global_position).normalized() * speeed
	#input_vector = move_and_slide(input_vector * delta)
	if dir == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		move_and_slide(input_vector * speed)
		$AnimationTree.set("parameters/Idle/blend_position", dir)
		$AnimationTree.set("parameters/Walk/blend_position", dir)

func cam_shake():
	get_parent().get_node("Animatronic/Camera2D").set_offset(Vector2( \
		rand_range(-1.0, 1.0) * shake_amount, \
		rand_range(-1.0, 1.0) * shake_amount \
	))

func _on_Area2D_area_entered(area):
	if $Area2D.overlaps_area(get_parent().get_node("Animatronic/Area2D")):
		durability_minus = true
		$CanvasLayer/static.show()

func _on_Area2D_area_exited(area):
	durability_minus = false
	$CanvasLayer/static.hide()
