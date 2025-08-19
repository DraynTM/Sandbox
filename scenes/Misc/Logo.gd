extends Control

func _ready():
#	ProjectSettings.load_resource_pack("res://mod.pck")
#	# Now you can use the assets as if you had them in the project from the start
#	var imported_scene = load("res://modScene.tscn")
	Global.load_settings()
	print(Global.guards_killed)

func _process(delta):
	GameJoltAPI.username = str(Global.gj_nickname)
	GameJoltAPI.user_token = str(Global.gj_token)
	GameJoltAPI.set_game_credentials({
	  "game_id": "690669",
	  "private_key": "5480b7c877d0eb33eb9d76285cdfe638"
	})
#	if Input.is_action_just_pressed("1"):
#		var trophy_request = GameJoltAPI.add_achieved({
#		 "username": GameJoltAPI.username,
#		 "user_token": GameJoltAPI.user_token,
#		 "trophy_id": "158669"
#		})
#		print("trophy unlocked")
#		trophy_request

func _on_Timer_timeout():
	if Global.gamej == 0:
		get_tree().change_scene("res://scenes/GameJolt_API.tscn")
	if Global.gamej == 1:
		get_tree().change_scene("res://scenes/Menu.tscn")
