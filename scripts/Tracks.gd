extends Control
onready var gc = get_parent().get_node("Faz_Coins")
onready var current_track = get_parent().get_node("Node2D")
onready var fanfare = $Buying_Sound
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
var save_file = "user://fnafsandbox-musics.save" #файл сохранения
var curpath = ""
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
	file.store_var(curpath)
	file.store_var(current_track.track)
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
		unlocked10 = file.get_var()
		curpath = file.get_var()
		current_track.track = file.get_var()
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
		curpath = 0
		current_track.track = 0

func _ready():
	load_settings()

func _process(delta):
	check()
	buy_bg()
	if $VBoxContainer/HBoxContainer/COD.pressed:
		current_track.track = 0
		save_settings()
	if unlocked1 == 1:
		if $VBoxContainer/HBoxContainer/parish.pressed:
			current_track.track = 1
			save_settings()
	if unlocked2 == 1:
		if $VBoxContainer/HBoxContainer/ttoacw.pressed:
			current_track.track = 2
			save_settings()
	if unlocked3 == 1:
		if $VBoxContainer/HBoxContainer3/tjoc.pressed:
			current_track.track = 3
			save_settings()
	if unlocked4 == 1:
		if $VBoxContainer/HBoxContainer3/cn.pressed:
			current_track.track = 4
			save_settings()
	if unlocked5 == 1:
		if $VBoxContainer/HBoxContainer3/thank_you.pressed:
			current_track.track = 5
			save_settings()
	if unlocked6 == 1:
		if $VBoxContainer/HBoxContainer3/fnaf3_lofi.pressed:
			current_track.track = 6
			save_settings()
	if unlocked7 == 1:
		if $VBoxContainer/HBoxContainer2/fnaf2_lofi.pressed:
			current_track.track = 7
			save_settings()
	if unlocked8 == 1:
		if $VBoxContainer/HBoxContainer2/vb.pressed:
			current_track.track = 8
			save_settings()
	if unlocked9 == 1:
		if $VBoxContainer/HBoxContainer2/daycare.pressed:
			current_track.track = 9
			save_settings()
	if unlocked10 == 1:
		if $VBoxContainer/LOAD.pressed:
			$test/FileDialog.popup_centered()

func check():
	if unlocked1 == 1:
		$VBoxContainer/HBoxContainer/parish/PRICE.hide()
	if unlocked2 == 1:
		$VBoxContainer/HBoxContainer/ttoacw/PRICE.hide()
	if unlocked3 == 1:
		 $VBoxContainer/HBoxContainer3/tjoc/PRICE.hide()
	if unlocked4 == 1:
		$VBoxContainer/HBoxContainer3/cn/PRICE.hide()
	if unlocked5 == 1:
		$VBoxContainer/HBoxContainer3/thank_you/PRICE.hide()
	if unlocked6 == 1:
		$VBoxContainer/HBoxContainer3/fnaf3_lofi/PRICE.hide()
	if unlocked7 == 1:
		$VBoxContainer/HBoxContainer2/fnaf2_lofi/PRICE.hide()
	if unlocked8 == 1:
		$VBoxContainer/HBoxContainer2/vb/PRICE.hide()
	if unlocked9 == 1:
		$VBoxContainer/HBoxContainer2/daycare/PRICE.hide()
	if unlocked10 == 1:
		$VBoxContainer/LOAD/PRICE.hide()

func buy_bg():
	if gc.gold_coins == 2 or gc.gold_coins > 2:
		if unlocked1 == 0:
			if $VBoxContainer/HBoxContainer/parish.pressed:
				unlocked1 = 1
				fanfare.play()
				gc.gold_coins -= 2
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 6 or gc.gold_coins > 6:
		if unlocked2 == 0:
			if $VBoxContainer/HBoxContainer/ttoacw.pressed:
				unlocked2 = 1
				fanfare.play()
				gc.gold_coins -= 6
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 5 or gc.gold_coins > 5:
		if unlocked3 == 0:
			if $VBoxContainer/HBoxContainer3/tjoc.pressed:
				unlocked3 = 1
				fanfare.play()
				gc.gold_coins -= 5
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked4 == 0:
			if $VBoxContainer/HBoxContainer3/cn.pressed:
				unlocked4 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 3 or gc.gold_coins > 3:
		if unlocked5 == 0:
			if $VBoxContainer/HBoxContainer3/thank_you.pressed:
				unlocked5 = 1
				fanfare.play()
				gc.gold_coins -= 3
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 6 or gc.gold_coins > 6:
		if unlocked6 == 0:
			if $VBoxContainer/HBoxContainer3/fnaf3_lofi.pressed:
				unlocked6 = 1
				fanfare.play()
				gc.gold_coins -= 6
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 6 or gc.gold_coins > 6:
		if unlocked7 == 0:
			if $VBoxContainer/HBoxContainer2/fnaf2_lofi.pressed:
				unlocked7 = 1
				fanfare.play()
				gc.gold_coins -= 6
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 4 or gc.gold_coins > 4:
		if unlocked8 == 0:
			if $VBoxContainer/HBoxContainer2/vb.pressed:
				unlocked8 = 1
				fanfare.play()
				gc.gold_coins -= 4
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 0 or gc.gold_coins > 0:
		if unlocked9 == 0:
			if $VBoxContainer/HBoxContainer2/daycare.pressed:
				unlocked9 = 1
				fanfare.play()
				gc.gold_coins -= 1
				gc.save_settings()
				save_settings()
				
				var trophy_request = GameJoltAPI.add_achieved({
				 "username": GameJoltAPI.username,
				 "user_token": GameJoltAPI.user_token,
				 "trophy_id": "158978"
				})
				print("trophy unlocked")
				trophy_request
				
	if gc.gold_coins == 7 or gc.gold_coins > 7:
		if unlocked10 == 0:
			if $VBoxContainer/LOAD.pressed:
				unlocked10 = 1
				fanfare.play()
				gc.gold_coins -= 7
				gc.save_settings()
				save_settings()
