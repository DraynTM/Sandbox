extends KinematicBody2D
export var speed = 0.1
export var can_walk = true
func _physics_process(delta):
	if can_walk == true:
		if Input.is_action_pressed("s"):
			position.y += speed
		if Input.is_action_pressed("s"):
			$walking.play("walk")
		else:
			$walking.play("idle")
