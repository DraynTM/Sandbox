extends Node2D
export var cam = 0
export var can_jump = true
export var guard_type = 0 #0 - фнаф 1 | 1 - отключить охранника
var mask_random = 0
var doors = 0
var mask = false
var camera = false
var can_noise = true
var can_awareness = true
var guard_see = false
onready var noise = $CanvasLayer/NOISE/TextureProgress
onready var awareness = $CanvasLayer/AWER/TextureProgress
func _ready():
	randomize()
	#$Timer.wait_time = ceil(rand_range(5, 10))
	$CanvasLayer/CAM.text = "CAMERA: NOT ACTIVE"
	$CanvasLayer/Mask.start()

func _process(delta):
	#print(mask_random)
	if guard_see == true:
		awareness.value += 1.5
	#print(camera)
	if can_noise == true:
		if Input.is_action_pressed("a") or Input.is_action_pressed("w") or Input.is_action_pressed("d") or Input.is_action_pressed("s"):
			noise.value += 2
	if not Input.is_action_pressed("a") or not Input.is_action_pressed("w") or not Input.is_action_pressed("d") or not Input.is_action_pressed("s"):
		noise.value -= 1
	if can_awareness == true:
		if noise.value > 40: #система поднятия тревоги
			awareness.value += 1
	if can_awareness == true:
		if noise.value < 40: #система снижения тревоги
			awareness.value -= 1
	if guard_type == 0: #классика
		doors_system()
		$Sprite/Area2D.monitoring = true
		$Mask.monitoring = false
		$Sprite.show()
		$Door1.show()
		$Door2.show()
		$Door1/StaticBody2D.monitoring = true
		$Door2/StaticBody2D.monitoring = true
	if guard_type == 1: #выключить охранника
		$Sprite/Area2D.monitoring = false
		$Mask.monitoring = false
		$Sprite.hide()
		$Door1.hide()
		$Door2.hide()
		$Door1/StaticBody2D.monitoring = false
		$Door2/StaticBody2D.monitoring = false
	if guard_type == 2:
		$Mask.monitoring = false
		can_awareness = false
		$Door1/StaticBody2D.monitoring = false
		$Door2/StaticBody2D.monitoring = false
	if guard_type == 3: #фнаф 2
		mask_system()
		$Sprite/Area2D.monitoring = false
		$Mask.monitoring = true
		$Sprite.show()
		$Door1.hide()
		$Door2.hide()
		$Door1/StaticBody2D.monitoring = false
		$Door2/StaticBody2D.monitoring = false

func doors_system(): #система дверей
	if awareness.value == 30:
		$Door1.show()
		$Door2.show()
		doors = 1
		$Door_Sound.play()
	if awareness.value == 1:
		$Door1.hide()
		$Door2.hide()
		doors = 0
		$Door_Sound.play()
	if doors == 0: #закрытие дверей
		$Door1.hide()
		$Door2.hide()
		$AnimationPlayer.play("lock_doors")
	if doors == 1: #открытие дверей
		$Door1.show()
		$Door2.show()
		$AnimationPlayer.play("RESET")

func mask_system():
	if mask_random == 0 or mask_random < 0:
		mask = false
	if mask_random == 1 or mask_random > 1:
		mask = true

	if mask == true:
		$Sprite/Mask.show()
	if mask == false:
		$Sprite/Mask.hide()
	
	$Door1.hide()
	$Door2.hide()

func _on_Area2D_area_entered(area): #скример
	if (can_jump):
		if $Sprite/Area2D.overlaps_area(get_parent().get_node("Animatronic/Area2D")):
			get_parent().get_node("JUMPSCARE/jump").play("jumpscare")
			get_parent().get_node("JUMPSCARE/Timer").start()
			get_parent().get_node("Animatronic").can_move = false

func _on_Timer_timeout():
	if cam == 0:
		$CanvasLayer/CAM.text = "CAMERA: NOT ACTIVE"
		Engine.time_scale = 1
		camera = false
		$Camera_Sound.play()
		$Timer2.start()
		$Timer.stop()
		$Timer2.wait_time = ceil(rand_range(8, 20))

func _on_Timer2_timeout():
	if cam == 0:
		$CanvasLayer/CAM.text = "CAMERA: ACTIVE"
		camera = true
		$Camera_Sound.play()
		$Timer.start()
		$Timer2.stop()
		Engine.time_scale = 0.1

func _on_StaticBody2D_area_entered(area):
	if $Door1/StaticBody2D.overlaps_area(get_parent().get_node("Animatronic/Area2D")) or $Door2/StaticBody2D.overlaps_area(get_parent().get_node("Animatronic/Area2D")) :
		get_parent().get_node("Animatronic").position = get_parent().get_node("Spawnpoint").position
		$Door_Teleport.play()

func _on_Guard_Vision_area_entered(area):
	if $Guard_Vision.overlaps_area(get_parent().get_node("Animatronic/Area2D")):
		$Sprite/WARNING.show()
		guard_see = true
	
func _on_Guard_Vision_area_exited(area):
	$Sprite/WARNING.hide()
	guard_see = false

func _on_Scanning_timeout():
	if mask == false:
		get_parent().get_node("JUMPSCARE/jump").play("jumpscare")
		get_parent().get_node("JUMPSCARE/Timer").start()
		get_parent().get_node("Animatronic").can_move = false
		$CanvasLayer/Scanning.hide()
	if mask == true:
		$CanvasLayer/Scanning.hide()
		get_parent().get_node("Animatronic").position = get_parent().get_node("Spawnpoint").position

func _on_Mask_area_entered(area):
	if $Mask.overlaps_area(get_parent().get_node("Animatronic/Area2D")):
		$CanvasLayer/Timer.start()
		$CanvasLayer/Scanning.show()
		$CanvasLayer/Scanning/AnimationPlayer.play("scan")

func _on_Mask_timeout():
	mask_random = ceil(rand_range(-1, 1))

func _on_Halloween_area_entered(area):
	if $Door1/StaticBody2D.overlaps_area(get_parent().get_node("Animatronic/Wing/Halloween/Area2D")):
		$Door1.position = Vector2(12931,12931)
		$Destroyed.play()
	if $Door2/StaticBody2D.overlaps_area(get_parent().get_node("Animatronic/Wing/Halloween/Area2D")):
		$Door2.position = Vector2(12931,12931)
		$Destroyed.play()
