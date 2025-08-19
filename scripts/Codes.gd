extends Control

var save_file = "user://fnafsandbox-codes.save" #файл сохранения
export var locker = 0 
export var locker2 = 0 
func save_settings(): 
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(locker)
	file.store_var(locker2)
	file.close()
func load_settings():
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		locker = file.get_var()
		locker2 = file.get_var()
		file.close()
	else:
		locker = 0
		locker2 = 0

func _ready():
	load_settings()

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")


func _on_CODE_text_entered(new_text):
	if new_text == "quit":
		get_tree().quit()
	if new_text == "1987":
		pass
	if locker == 0:
		if new_text == "veri sicret code for koinz":
			locker = 1
			$Faz_Coins.coins += 24
			$Faz_Coins.save_settings()
			save_settings()
	if locker2 == 0:
		if new_text == "I have one dream, I want to become rich":
			locker2 = 1
			$Faz_Coins.gold_coins += 6
			$Faz_Coins.save_settings()
			save_settings()
	if new_text == "open this door":
		$LOGO.text = "NOPE"
	if new_text == "open this damn door":
		$LOGO.text = "N    O    P    E"
	if new_text == "1983 1987 1993 2023":
		$AnimationPlayer.play("unlocked")
		$Timer.start()
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159527"
		})
		print("trophy unlocked")
		trophy_request

func _on_Timer_timeout():
	pass # Replace with function body.
