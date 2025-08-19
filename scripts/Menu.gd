extends Control
var dev_debug = false #false - выкл дебаг | true - вкл дебаг
var window_name = 0
var frame = 0
onready var poppup2 : FileDialog = $UI/FileDialog

func _ready():
	Global.load_settings()
	randomize()
	window_name = ceil(rand_range(0, 22))
	Engine.time_scale = 1
	print(GameJoltAPI.username)
	print(GameJoltAPI.user_token)
	pass
	
func _process(delta):
	debug()
	if Input.is_action_just_pressed("1"):
		$UI/ModManager.visible = !$UI/ModManager.visible
	$UI/STATS/GK.text = "Guards Killed: " + str(Global.guards_killed)
	$UI/STATS/EXP.text = "EXP: " + str(Global.xp)
	$UI/STATS/EXP2.text = "RANK: " + str(Global.rank)
	$UI/STATS/YP.text = "You played: " + str(Global.time) + " Seconds"
	if Global.gamej == 0:
		$UI/STATS/NICK.text = "Nickname not found"
		$UI/NIKNAME.text = "Nickname not found"
		$UI/STATS/GJ.text = "GAMEJOLT: Not connected"
	if Global.gamej == 1:
		$UI/STATS/NICK.text = str(GameJoltAPI.username)
		$UI/NIKNAME.text = str(GameJoltAPI.username)
		$UI/STATS/GJ.text = "GAMEJOLT: Connected"
	if window_name == 1:
		OS.set_window_title("FNAF SANDBOX: Security Alert! Security Alert! Woo Woo Woo~")
	if window_name == 2:
		OS.set_window_title("FNAF SANDBOX: You are my superstar!")
	if window_name == 3:
		OS.set_window_title("FNAF SANDBOX: It's me!")
	if window_name == 4:
		OS.set_window_title("FNAF SANDBOX: Godot or Clickteam?")
	if window_name == 5:
		OS.set_window_title("FNAF SANDBOX: The man behind the slaughter...")
	if window_name == 6:
		OS.set_window_title("FNAF SANDBOX: I always comeback!")
	if window_name == 7:
		OS.set_window_title("FNAF SANDBOX: print(Hello World!)")
	if window_name == 8:
		OS.set_window_title("FNAF SANDBOX: Cheese")
	if window_name == 9:
		OS.set_window_title("FNAF SANDBOX: press alt + f4")
	if window_name == 10:
		OS.set_window_title("FNAF SANDBOX: also try FnaF Simulator Origins!")
	if window_name == 11:
		OS.set_window_title("FNAF SANDBOX: соррян, но русского языка не будет")
	if window_name == 12:
		OS.set_window_title("FNAF SANDBOX: Please deposit, five coins")
	if window_name == 13:
		OS.set_window_title("FNAF SANDBOX: Faz-toilet")
	if window_name == 14:
		OS.set_window_title("FNAF SANDBOX: Sus")
	if window_name == 15:
		OS.set_window_title("FNAF SANDBOX: Faz of Cthulhu")
	if window_name == 16:
		OS.set_window_title("FNAF SANDBOX: Rod of Twitter")
	if window_name == 17:
		OS.set_window_title("FNAF SANDBOX: Nye-he-he-he")
	if window_name == 18:
		OS.set_window_title("FNAF SANDBOX: Cult of Genos")
	if window_name == 19:
		OS.set_window_title("FNAF SANDBOX: Pog")
	if window_name == 20:
		OS.set_window_title("FNAF SANDBOX: Just a random splash")
	if window_name == 21:
		OS.set_window_title("FNAF SANDBOX: Do u wanna have a *Meow* time?")
	if window_name == 22:
		OS.set_window_title("FNAF SANDBOX: When android version, Drayn?")

func debug(): #дебаг для разработчиков
	if dev_debug == true:
		if Input.is_key_pressed(KEY_DELETE):
			$UI/Faz_Coins.coins += 2
			$UI/Faz_Coins.gold_coins += 1
			$UI/Faz_Coins.save_settings()
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/main.tscn")

func _on_Create_a_Map_pressed(): #создать карту
	$Timer.start()
	$UI/Level_Selecter/AudioStreamPlayer.play()
	$AnimationPlayer.play("fade")

func _on_Quit_pressed(): #выйти из игры
	$UI/SEE_YA.show()
	$UI/Level_Selecter/AudioStreamPlayer.play()
	$AnimationPlayer.play("fade")
	$Timer/Timer_Quit.start()
	frame = 0

func _on_Timer_Quit_timeout():
	if frame == 0:
		get_tree().quit()
	if frame == 1:
		get_tree().change_scene("res://scenes/Codes.tscn")
	if frame == 2:
		get_tree().change_scene("res://scenes/Animatronic editor.tscn")

func _on_Random_Title_timeout():
	pass

func _on_Options_pressed(): #настройки
	$UI/Options.visible = !$UI/Options.visible
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Bg_pressed():
	$UI/BGS.visible = !$UI/BGS.visible
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Tracks_pressed():
	$UI/Tracks.visible = !$UI/Tracks.visible
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_SD_pressed():
	OS.shell_open("https://www.donationalerts.com/r/drayn")
	var trophy_request = GameJoltAPI.add_achieved({
	 "username": GameJoltAPI.username,
	 "user_token": GameJoltAPI.user_token,
	 "trophy_id": "158976"
	})
	print("trophy unlocked")
	trophy_request
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Team_pressed():
	$AnimationPlayer.play("fade")
	$Timer/Timer_Quit.start()
	frame = 2
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Team2_pressed():
	$UI/Level_Selecter.show()
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Publishing_Searching_pressed():
	OS.shell_open("https://gamejolt.com/c/fnafso-cfzttt/maps")
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_STATS_pressed():
	$UI/STATS.popup_centered()
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Load_Photo_confirmed():
	pass

func _on_FileDialog_file_selected(path):
#	var toLoad : Texture = Texture.new()
#	toLoad = ResourceLoader.load(poppup2.current_path)
#	var image = toLoad
#	$UI/STATS/PFP.texture = toLoad
	pass

func _on_Button2_pressed():
	$UI/FileDialog.popup_centered()
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_Connect_GJ_pressed():
	get_tree().change_scene("res://scenes/GameJolt_API.tscn")
	$UI/Level_Selecter/AudioStreamPlayer.play()

func _on_CODES_pressed():
	$AnimationPlayer.play("fade")
	$Timer/Timer_Quit.start()
	$UI/Level_Selecter/AudioStreamPlayer.play()
	frame = 1

func _on_NEWS_pressed():
	$UI/NEWS.popup_centered()
	$UI/Level_Selecter/AudioStreamPlayer.play()
