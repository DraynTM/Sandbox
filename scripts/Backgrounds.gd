extends CanvasLayer
onready var gc = $Faz_Coins
onready var fanfare = $BGS/Buying_Sound
onready var current_bg = get_parent().get_node("CoolestBG")
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
var unlocked11 = 0
var unlocked12 = 0
var unlocked13 = 0
var unlocked14 = 0
var unlocked15 = 0
var save_file = "user://fnafsandbox-bg.save" #файл сохранения
func save_settings(): 
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
	file.store_var(unlocked11)
	file.store_var(unlocked12)
	file.store_var(unlocked13)
	file.store_var(unlocked14)
	file.store_var(current_bg.background)
	file.close()

func load_settings(): 
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
		unlocked10= file.get_var()
		unlocked11 = file.get_var()
		unlocked12 = file.get_var()
		unlocked13 = file.get_var()
		unlocked14 = file.get_var()
		current_bg.background = file.get_var()
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
		unlocked11 = 0
		unlocked12 = 0
		unlocked13 = 0
		unlocked14 = 0
		current_bg.background = 0

func _ready():
	load_settings()

func _process(delta):
	check()
	buy_bg()
	if $BGS/bg1.pressed:
		get_parent().get_node("CoolestBG").background = 0
		$BGS.hide()
		save_settings()
	if unlocked1 == 1:
		if $BGS/bg2.pressed:
			get_parent().get_node("CoolestBG").background = 1
			$BGS.hide()
			save_settings()
	if unlocked2 == 1:
		if $BGS/bg3.pressed:
			get_parent().get_node("CoolestBG").background = 2
			$BGS.hide()
			save_settings()
	if unlocked3 == 1:
		if $BGS/bg4.pressed:
			get_parent().get_node("CoolestBG").background = 3
			$BGS.hide()
			save_settings()
	if unlocked4 == 1:
		if $BGS/bg5.pressed:
			get_parent().get_node("CoolestBG").background = 4
			$BGS.hide()
			save_settings()
	if unlocked5 == 1:
		if $BGS/bg6.pressed:
			get_parent().get_node("CoolestBG").background = 5
			$BGS.hide()
			save_settings()
	if unlocked6 == 1:
		if $BGS/bg7.pressed:
			get_parent().get_node("CoolestBG").background = 6
			$BGS.hide()
			save_settings()
	if unlocked7 == 1:
		if $BGS/bg8.pressed:
			get_parent().get_node("CoolestBG").background = 7
			$BGS.hide()
			save_settings()
	if unlocked8 == 1:
		if $BGS/bg9.pressed:
			get_parent().get_node("CoolestBG").background = 8
			$BGS.hide()
			save_settings()
	if unlocked9 == 1:
		if $BGS/bg10.pressed:
			get_parent().get_node("CoolestBG").background = 9
			$BGS.hide()
			save_settings()
	if unlocked10 == 1:
		if $BGS/bg11.pressed:
			get_parent().get_node("CoolestBG").background = 10
			$BGS.hide()
			save_settings()
	if unlocked11 == 1:
		if $BGS/bg12.pressed:
			get_parent().get_node("CoolestBG").background = 11
			$BGS.hide()
			save_settings()
	if unlocked12 == 1:
		if $BGS/bg13.pressed:
			get_parent().get_node("CoolestBG").background = 12
			$BGS.hide()
			save_settings()
	if unlocked13 == 1:
		if $BGS/bg14.pressed:
			get_parent().get_node("CoolestBG").background = 13
			$BGS.hide()
			save_settings()
	if unlocked14 == 1:
		if $BGS/bg15.pressed:
			get_parent().get_node("CoolestBG").background = 14
			$BGS.hide()
			save_settings()

func check():
	if unlocked1 == 1:
		$BGS/bg2/PRICE.hide()
	if unlocked2 == 1:
		$BGS/bg3/PRICE.hide()
	if unlocked3 == 1:
		$BGS/bg4/PRICE.hide()
	if unlocked4 == 1:
		$BGS/bg5/PRICE.hide()
	if unlocked5 == 1:
		$BGS/bg6/PRICE.hide()
	if unlocked6 == 1:
		$BGS/bg7/PRICE.hide()
	if unlocked7 == 1:
		$BGS/bg8/PRICE.hide()
	if unlocked8 == 1:
		$BGS/bg9/PRICE.hide()
	if unlocked9 == 1:
		$BGS/bg10/PRICE.hide()
	if unlocked10 == 1:
		$BGS/bg11/PRICE.hide()
	if unlocked11 == 1:
		$BGS/bg12/PRICE.hide()
	if unlocked12 == 1:
		$BGS/bg13/PRICE.hide()
	if unlocked13 == 1:
		$BGS/bg14/PRICE.hide()
	if unlocked14 == 1:
		$BGS/bg15/PRICE.hide()

func buy_bg():
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked1 == 0:
			if $BGS/bg2.pressed:
				unlocked1 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked2 == 0:
			if $BGS/bg3.pressed:
				unlocked2 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked3 == 0:
			if $BGS/bg4.pressed:
				unlocked3 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 1 or gc.gold_coins > 1:
		if unlocked4 == 0:
			if $BGS/bg5.pressed:
				unlocked4 = 1
				fanfare.play()
				gc.gold_coins -= 1
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 1 or gc.gold_coins > 1:
		if unlocked5 == 0:
			if $BGS/bg6.pressed:
				unlocked5 = 1
				fanfare.play()
				gc.gold_coins -= 1
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked6 == 0:
			if $BGS/bg7.pressed:
				unlocked6 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked7 == 0:
			if $BGS/bg8.pressed:
				unlocked7 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked8 == 0:
			if $BGS/bg9.pressed:
				unlocked8 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked9 == 0:
			if $BGS/bg10.pressed:
				unlocked9 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked10 == 0:
			if $BGS/bg11.pressed:
				unlocked10 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 1 or gc.gold_coins > 1:
		if unlocked11 == 0:
			if $BGS/bg12.pressed:
				unlocked11 = 1
				fanfare.play()
				gc.gold_coins -= 1
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked12 == 0:
			if $BGS/bg13.pressed:
				unlocked12 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked13 == 0:
			if $BGS/bg14.pressed:
				unlocked13 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked14 == 0:
			if $BGS/bg15.pressed:
				unlocked14 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158977"
				})
				print("trophy unlocked")
				trophy_request
