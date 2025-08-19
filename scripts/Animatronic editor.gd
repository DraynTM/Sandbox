extends CanvasLayer

onready var sprite = get_parent().get_node("Animatronic/custom")
onready var cam = get_parent().get_node("Camera2D")
var is_panning = true;
var unlocked1 = 0
var unlocked2 = 0
var unlocked3 = 0
var unlocked4 = 0
var unlocked5 = 0
var unlocked6 = 0
var unlocked7 = 0
var unlocked8 = 0
var unlocked9 = 0
var unlocked10 = 0
var save_file = "user://fnafsandbox-abilities.save" #файл сохранения

func save_settings(): #сохранение коинов
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(unlocked1)
	file.store_var(unlocked2)
	file.store_var(unlocked3)
	file.store_var(unlocked4)
	file.store_var(unlocked5)
	file.store_var(unlocked6)
	file.store_var(unlocked7)
	file.store_var(unlocked8)
	file.store_var(unlocked9)
	file.store_var(unlocked10)
	file.close()

func load_settings(): #загрузка коинов
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		unlocked1 = file.get_var()
		unlocked2 = file.get_var()
		unlocked3 = file.get_var()
		unlocked4 = file.get_var()
		unlocked5 = file.get_var()
		unlocked6 = file.get_var()
		unlocked7 = file.get_var()
		unlocked8 = file.get_var()
		unlocked9 = file.get_var()
		unlocked10 = file.get_var()
		file.close()
	else:
		unlocked1 = 0
		unlocked2 = 0
		unlocked3 = 0
		unlocked4 = 0
		unlocked5 = 0
		unlocked6 = 0
		unlocked7 = 0
		unlocked8 = 0
		unlocked9 = 0
		unlocked10 = 0

func _ready():
	randomize()
	load_settings()
	get_parent().get_node("Animatronic/abilities").can_use_ability = false
	get_parent().get_node("Animatronic/Camera2D").current = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").color = sprite.color_head 
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").color = sprite.color_body
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").color = sprite.color_legs
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").color = sprite.color_hat
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").color = sprite.color_eyes
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").color = sprite.color_eyes2
	get_parent().get_node("Animatronic/HUD/Abilities").hide()
	if unlocked2 == 1:
		$Customizing_Character/Abilities/Sedative/price.hide()
	if unlocked1 == 1:
		$Customizing_Character/Abilities/Speed2/price.hide()
	if unlocked3 == 1:
		$Customizing_Character/Abilities/Teleport/price.hide()
	if unlocked4 == 1:
		$Customizing_Character/Abilities/fivex/price.hide()
	if unlocked5 == 1:
		$Customizing_Character/Abilities/mouse/price.hide()
	if unlocked7 == 1:
		$Customizing_Character/Abilities2/binocle/price.hide()
	if unlocked8 == 1:
		$Customizing_Character/Abilities2/guitar/price.hide()
	if unlocked9 == 1:
		$Customizing_Character/Abilities2/halloween/price.hide()
	if unlocked10 == 1:
		$Customizing_Character/Abilities2/gods_gift/price.hide()

func _process(delta):
	get_parent().get_node("Animatronic").scale = Vector2(60,60)
	cam.zoom.x = $Customizing_Character/VBoxContainer2/Label/HSlider.value
	cam.zoom.y = $Customizing_Character/VBoxContainer2/Label/HSlider.value
	$Customizing_Character/Label.text = str(sprite.color_head)
	$Customizing_Character/VBoxContainer2/HEAD/TYPE.text = str(sprite.head)
	$Customizing_Character/VBoxContainer2/HAT/TYPE.text = str(sprite.hat)
	$Customizing_Character/VBoxContainer2/BODY/TYPE.text = str(sprite.body)
	$Customizing_Character/VBoxContainer2/LEGS/TYPE.text = str(sprite.legs)
	sprite.color_head = get_parent().get_node("CanvasLayer/Customizing_Character/head_color").color
	sprite.color_body = get_parent().get_node("CanvasLayer/Customizing_Character/body_color").color
	sprite.color_legs = get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").color
	sprite.color_hat = get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").color
	sprite.color_eyes = get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").color
	sprite.color_eyes2 = get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").color
	is_panning = Input.is_action_pressed("mb_middle")

func _on_SAVE_pressed():
	sprite.save_settings()
	sprite.load_settings()
	$Customizing_Character/Sound.play()
	var trophy_request = GameJoltAPI.add_achieved({
	 "username": GameJoltAPI.username,
	 "user_token": GameJoltAPI.user_token,
	 "trophy_id": "158689"
	})
	print("trophy unlocked")
	trophy_request

func _on_HEAD_COLOUR_pressed():
	$Customizing_Character/head_color.visible = !$Customizing_Character/head_color.visible
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = false
	$Customizing_Character/Sound.play()

func _on_MINUS_HEAD_pressed():
	sprite.head -= 1
	pass

func _on_PLUS_HEAD_pressed():
	sprite.head += 1
	pass

func _on_MINUS_HAT_pressed():
	sprite.hat -= 1
	pass

func _on_PLUS_HAT_pressed():
	sprite.hat += 1
	pass

func _on_HAT_COLOUR_pressed():
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = !get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").visible = false
	$Customizing_Character/Sound.play()

func _on_EYES_COLOUR_pressed():
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = !get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").visible = false
	$Customizing_Character/Sound.play()

func _on_EYES2_COLOUR_pressed():
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = !get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").visible = false
	$Customizing_Character/Sound.play()

func _on_BODY_COLOUR_pressed():
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = !get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").visible = false
	$Customizing_Character/Sound.play()

func _on_MINUS_BODY_pressed():
	sprite.body -= 1
	pass 

func _on_PLUS_BODY_pressed():
	sprite.body += 1
	pass 

func _on_LEGS_COLOUR_pressed():
	get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible = !get_parent().get_node("CanvasLayer/Customizing_Character/legs_color").visible
	get_parent().get_node("CanvasLayer/Customizing_Character/eye_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/eye2_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/body_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/hat_color").visible = false
	get_parent().get_node("CanvasLayer/Customizing_Character/head_color").visible = false

func _on_MINUS_LEGS_pressed():
	sprite.legs -= 1
	pass 

func _on_PLUS_LEGS_pressed():
	sprite.legs += 1
	pass 

func _on_RANDOM_pressed():
	var rad = RandomNumberGenerator.new()
	sprite.hat = ceil(rand_range(-1,7))
	sprite.head = ceil(rand_range(-1,21))
	sprite.body = ceil(rand_range(-1,21))
	sprite.legs = ceil(rand_range(-1,7))
	$Customizing_Character/Sound.play()

func _on_ERASE_pressed():
	$Customizing_Character/ARE_U_SURE.popup_centered()
	$Customizing_Character/Sound.play()

func _on_ARE_U_SURE_confirmed():
	var dir = Directory.new()
	dir.remove("user://fnafsandbox-character.save")
	get_tree().reload_current_scene()
	$Customizing_Character/Sound.play()

func _on_BACK_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_ABILITY_pressed():
	$Customizing_Character/Abilities.visible = !$Customizing_Character/Abilities.visible
	$Customizing_Character/Sound.play()

func _on_Speed_pressed():
	sprite.ability = 5
	$Customizing_Character/Abilities.hide()
	$Customizing_Character/Sound.play()

func _on_Speed2_pressed():
	if unlocked1 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 35 or $Customizing_Character/Abilities/Faz_Coins.coins > 35:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities/Speed2/price.hide()
			unlocked1 = 1
			save_settings()
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "159551"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked1 == 1:
		sprite.ability = 1
		$Customizing_Character/Abilities.hide()
		$Customizing_Character/Sound.play()

func _on_Sedative_pressed():
	if unlocked2 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 50 or $Customizing_Character/Abilities/Faz_Coins.coins > 50:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities/Sedative/price.hide()
			unlocked2 = 0
			save_settings()
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "159550"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked2 == 1:
		sprite.ability = 0
		$Customizing_Character/Abilities.hide()
		$Customizing_Character/Sound.play()

func _on_Teleport_pressed():
	if unlocked3 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 70 or $Customizing_Character/Abilities/Faz_Coins.coins > 70:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities/Teleport/price.hide()
			unlocked3 = 1
			save_settings()
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "159553"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked3 == 1:
		sprite.ability = 3
		$Customizing_Character/Abilities.hide()
		$Customizing_Character/Sound.play()

func _on_5x_pressed():
	if unlocked4 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 20 or $Customizing_Character/Abilities/Faz_Coins.coins > 20:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities/fivex/price.hide()
			unlocked4 = 0
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "159552"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked4 == 1:
		sprite.ability = 2
		$Customizing_Character/Abilities.hide()
		$Customizing_Character/Sound.play()

func _on_mouse_pressed():
	if unlocked5 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 160 or $Customizing_Character/Abilities/Faz_Coins.coins > 160:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities/mouse/price.hide()
			unlocked5 = 1
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "159554"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked5 == 1:
		sprite.ability = 4
		$Customizing_Character/Abilities.hide()
		$Customizing_Character/Sound.play()

func _on_disable_pressed():
	sprite.extra_ability = 0
	$Customizing_Character/Abilities2.hide()
	$Customizing_Character/Sound.play()

func _on_binocle_pressed():
	if unlocked7 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 10 or $Customizing_Character/Abilities/Faz_Coins.coins > 10:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities2/binocle/price.hide()
			unlocked7 = 1
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160007"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked7 == 1:
		sprite.extra_ability = 1
		$Customizing_Character/Abilities2.hide()
		$Customizing_Character/Sound.play()

func _on_guitar_pressed():
	if unlocked8 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 25 or $Customizing_Character/Abilities/Faz_Coins.coins > 25:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities2/guitar/price.hide()
			unlocked8 = 1
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160008"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked8 == 1:
		sprite.extra_ability = 3
		$Customizing_Character/Abilities2.hide()
		$Customizing_Character/Sound.play()

func _on_halloween_pressed():
	if unlocked9 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 170 or $Customizing_Character/Abilities/Faz_Coins.coins > 170:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities2/halloween/price.hide()
			unlocked9 = 1
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160009"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked9 == 1:
		sprite.extra_ability = 4
		$Customizing_Character/Abilities2.hide()
		$Customizing_Character/Sound.play()

func _on_gods_gift_pressed():
	if unlocked10 == 0:
		if $Customizing_Character/Abilities/Faz_Coins.coins == 250 or $Customizing_Character/Abilities/Faz_Coins.coins > 250:
			$Customizing_Character/Sound/Buying.play()
			$Customizing_Character/Abilities2/gods_gift/price.hide()
			unlocked10 = 1
			save_settings()
			
			var trophy_request = GameJoltAPI.add_achieved({
			 "username": GameJoltAPI.username,
			 "user_token": GameJoltAPI.user_token,
			 "trophy_id": "160010"
			})
			print("trophy unlocked")
			trophy_request

	if unlocked10 == 1:
		sprite.extra_ability = 2
		$Customizing_Character/Abilities2.hide()
		$Customizing_Character/Sound.play()


func _on_EXTRA_ABILITY_pressed():
	$Customizing_Character/Abilities2.visible = !$Customizing_Character/Abilities2.visible
	$Customizing_Character/Sound.play()
