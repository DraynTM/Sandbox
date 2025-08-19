extends Node2D
onready var TP_Particles = get_parent().get_node("Particles2D")
onready var Dash_Timer = get_parent().get_node("Timer/Dash_CD")
onready var shadow = get_parent().get_node("shadow")
onready var cooldown = get_parent().get_node("HUD/Abilities/TextureProgress")
onready var custom = get_parent().get_node("custom")
onready var sound = get_parent().get_node("Sound_Player")
export var dash_duration = 0.5
var can_use_ability = true
var trigger_use = true
var curdir = 0
var use_dash = true
var dash_start = false

func _ready():
	randomize()
	if custom.extra_ability == 2:
		get_parent().get_node(".").speed = 99
	if custom.extra_ability == 4:
		get_parent().get_node(".").speed = 80
	pass # Replace with function body.


func _process(delta):
	using_abilities()
	shadow.position = get_local_mouse_position()
	if custom.extra_ability == 3:
		get_parent().get_node("Wing/Guitar").show()
		get_parent().get_node("HUD/Abilities/Icon2/Label2").text = "Left Mouse Button"
	else:
		get_parent().get_node("Wing/Guitar").hide()
	if custom.extra_ability == 2:
		get_parent().get_node("Wing/Wings").show()
		get_parent().get_node("Wing/Particles2D").show()
		get_parent().get_node("HUD/Abilities/Icon2/Label2").text = "Shift"
	else:
		get_parent().get_node("Wing/Wings").hide()
		get_parent().get_node("Wing/Particles2D").hide()
	if custom.extra_ability == 4:
		get_parent().get_node("Wing/Pump").show()
		get_parent().get_node("Wing/PumpParticles").show()
		get_parent().get_node("Wing/Halloween").show()
		get_parent().get_node("Wing/Halloween/Area2D").monitoring = true
		get_parent().get_node("HUD/Abilities/Icon2/Label2").text = "Left Mouse Button"
	else:
		get_parent().get_node("Wing/Pump").hide()
		get_parent().get_node("Wing/PumpParticles").hide()
		get_parent().get_node("Wing/Halloween").hide()
		get_parent().get_node("Wing/Halloween/Area2D").monitoring = false
	if get_parent().get_node("HUD/Abilities/Label").text == "right mouse button":
		get_parent().get_node("HUD/Abilities/Icon2").rect_position.x = 723
	else:
		get_parent().get_node("HUD/Abilities/Icon2").rect_position.x = 854
	if trigger_use == true:
		if can_use_ability == true:
			cooldown.value += 10
	if custom.ability == 4:
		if cooldown.value == cooldown.max_value:
			get_parent().get_node("HUD/Abilities/Label").text = "right mouse button"
	if custom.ability == 4:
		if cooldown.value < cooldown.max_value:
			get_parent().get_node("HUD/Abilities/Label").text = "Z"
	if cooldown.value == cooldown.max_value:
		cooldown.hide()
	if cooldown.value < cooldown.max_value:
		cooldown.show()
	if Input.is_action_just_pressed("s"):
		curdir = 0
	if Input.is_action_just_pressed("a"):
		curdir = 1
	if Input.is_action_just_pressed("d"):
		curdir = 2
	if Input.is_action_just_pressed("w"):
		curdir = 3

func using_abilities():
	if trigger_use == true:
		if can_use_ability == true:
			if custom.extra_ability == 1:
				get_parent().get_node("Camera2D").offset = get_local_mouse_position()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.extra_ability == 2:
				if curdir == 0:
					if Input.is_action_just_pressed("run"):
						get_parent().get_node(".").position.y += 10
						sound.stream = preload("res://audio/Sounds/dash.wav")
						sound.play()
				if curdir == 3:
					if Input.is_action_just_pressed("run"):
						get_parent().get_node(".").position.y -= 10
						sound.stream = preload("res://audio/Sounds/dash.wav")
						sound.play()
				if curdir == 2:
					if Input.is_action_just_pressed("run"):
						get_parent().get_node(".").position.x += 10
						sound.stream = preload("res://audio/Sounds/dash.wav")
						sound.play()
				if curdir == 1:
					if Input.is_action_just_pressed("run"):
						get_parent().get_node(".").position.x -= 10
						sound.stream = preload("res://audio/Sounds/dash.wav")
						sound.play()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.extra_ability == 3:
				if Input.is_action_just_pressed("mb_left"):
					sound.stream = preload("res://audio/Sounds/Item8.wav")
					sound.pitch_scale = rand_range(0.8, 1.5)
					sound.play()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.extra_ability == 4:
				if Input.is_action_just_pressed("mb_left"):
					get_parent().get_node("Wing/AnimationPlayer").play("attack")
				if Input.is_action_just_released("mb_left"):
					get_parent().get_node("Wing/AnimationPlayer").play("idle")

	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 4:
				if Input.is_action_just_pressed("mb_right"):
					if cooldown.value == cooldown.max_value:
						get_parent().get_node(".").position = get_global_mouse_position()
						cooldown.value = cooldown.min_value
						sound.stream = preload("res://audio/Sounds/item2.mp3")
						sound.play()
						TP_Particles.emitting = true
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 3:
				if curdir == 1:
					if Input.is_action_just_pressed("ability"):
						if cooldown.value == cooldown.max_value:
							get_parent().get_node(".").position.x -= 60
							cooldown.value = cooldown.min_value
							sound.stream = preload("res://audio/Sounds/item2.mp3")
							sound.play()
							TP_Particles.emitting = true
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 3:
				if curdir == 2:
					if Input.is_action_just_pressed("ability"):
						if cooldown.value == cooldown.max_value:
							get_parent().get_node(".").position.x += 60
							cooldown.value = cooldown.min_value
							sound.stream = preload("res://audio/Sounds/item2.mp3")
							sound.play()
							TP_Particles.emitting = true
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 3:
				if curdir == 3:
					if Input.is_action_just_pressed("ability"):
						if cooldown.value == cooldown.max_value:
							get_parent().get_node(".").position.y -= 60
							cooldown.value = cooldown.min_value
							sound.stream = preload("res://audio/Sounds/item2.mp3")
							sound.play()
							TP_Particles.emitting = true
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 3:
				if curdir == 0:
					if Input.is_action_just_pressed("ability"):
						if cooldown.value == cooldown.max_value:
							get_parent().get_node(".").position.y += 60
							cooldown.value = cooldown.min_value
							sound.stream = preload("res://audio/Sounds/item2.mp3")
							sound.play()
							TP_Particles.emitting = true
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 2:
				if Input.is_action_just_pressed("ability"):
					if cooldown.value == cooldown.max_value:
						Engine.time_scale = 5
						cooldown.value = cooldown.min_value
						get_parent().get_node("Timer").start()
						sound.stream = preload("res://audio/Sounds/item3.mp3")
						sound.play()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 1:
				if Input.is_action_just_pressed("ability"):
					if cooldown.value == cooldown.max_value:
						get_parent().get_node(".").speed += 700
						cooldown.value = cooldown.min_value
						get_parent().get_node("Timer/Speed").start()
						sound.stream = preload("res://audio/Sounds/item5.wav")
						sound.play()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 0:
				if Input.is_action_just_pressed("ability"):
					if cooldown.value == cooldown.max_value:
						get_parent().get_node(".").awareness.value = 1
						cooldown.value = cooldown.min_value
						sound.stream = preload("res://audio/Sounds/item.mp3")
						sound.play()
	if trigger_use == true:
		if can_use_ability == true:
			if custom.ability == 5:
				if Input.is_action_just_pressed("ability"):
					if cooldown.value == cooldown.max_value:
						get_parent().get_node(".").speed += 200
						cooldown.value = cooldown.min_value
						get_parent().get_node("Timer/SpeedDefault").start()
						sound.stream = preload("res://audio/Sounds/item5.wav")
						sound.play()

func _on_Timer_timeout():
	Engine.time_scale = 1
	sound.stream = preload("res://audio/Sounds/item4.mp3")
	sound.play()

func _on_Speed_timeout():
	get_parent().get_node(".").speed -= 700
	sound.stream = preload("res://audio/Sounds/item4.mp3")
	sound.play()

func _on_SpeedDefault_timeout():
	get_parent().get_node(".").speed -= 200
	sound.stream = preload("res://audio/Sounds/item4.mp3")
	sound.play()

#func is_dashing():
#	if curdir == 1:
#		get_parent().get_node(".").global_position.x -= 10
#	if curdir == 2:
#		get_parent().get_node(".").position.x += 10
#	if curdir == 3:
#		get_parent().get_node(".").position.y -= 10
#	if curdir == 0:
#		get_parent().get_node(".").position.y += 10
