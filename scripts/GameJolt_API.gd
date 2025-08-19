extends Control

func _ready():
	Global.load_settings()
	print(GameJoltAPI.username)
	print(GameJoltAPI.user_token)

func _process(delta):
	GameJoltAPI.username = Global.gj_nickname
	GameJoltAPI.user_token = Global.gj_token
	GameJoltAPI.set_game_credentials({
	  "game_id": "690669",
	  "private_key": "5480b7c877d0eb33eb9d76285cdfe638"
	})
	

func _on_LineEdit_text_changed(new_text):
	Global.gj_nickname = new_text
	print(GameJoltAPI.username)

func _on_login_pressed():
	var trophy_request = GameJoltAPI.add_achieved({
	 "username": GameJoltAPI.username,
	 "user_token": GameJoltAPI.user_token,
	 "trophy_id": "158675"
		})
	print("trophy unlocked")
	trophy_request
	Global.gamej = 1
	Global.save_settings()
	$Timer.start()
	#get_tree().change_scene("res://scenes/Menu.tscn")

func _on_token_text_changed(new_text):
	Global.gj_token = new_text
	print(GameJoltAPI.user_token)

func _on_later_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/Menu.tscn")
