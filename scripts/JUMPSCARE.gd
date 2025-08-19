extends CanvasLayer

export var get_coins = true
onready var coins = $Win_Screen/Faz_Coins
onready var win_screen = $Win_Screen
onready var win_music = $jump_sound/win
onready var jump = $jump

func _ready():
	randomize()
	win_screen.hide()
	$Animatronic/Camera2D.current = false

func _process(delta):
	$Win_Screen/RANK_TEXT.text = "RANK: " + str(Global.rank)
	$Win_Screen/EXP.text = "EXP: " + str(Global.xp)

func _on_Timer_timeout():
	Global.guards_killed += 1
	Global.save_settings()
	Engine.time_scale = 1
	win_screen.show()
	win_music.play()

	var add_score_request_EXP = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": Global.xp,
	"sort": Global.xp,
	"table_id": "710060"
	})
	add_score_request_EXP

	var add_score_request = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": Global.guards_killed,
	"sort": Global.guards_killed,
	"table_id": "709006"
	})
	add_score_request

	var add_score_request_fazcoins = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": coins.coins,
	"sort": coins.coins,
	"table_id": "699259"
	})
	add_score_request_fazcoins

	var add_score_request_goldcoins = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": coins.gold_coins,
	"sort": coins.gold_coins,
	"table_id": "709016"
	})
	add_score_request_goldcoins

	if Global.guards_killed == 1:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158682"
		})
		print("trophy unlocked")
		trophy_request

	if Global.guards_killed == 10:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158683"
		})
		print("trophy unlocked")
		trophy_request

	if Global.guards_killed == 50:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158684"
		})
		print("trophy unlocked")
		trophy_request

	if Global.guards_killed == 100:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158685"
		})
		print("trophy unlocked")
		trophy_request

	if Global.guards_killed == 250:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "158687"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 1:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159528"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 5:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159529"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 7:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "160248"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 14:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159530"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 21:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159531"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 24:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "160247"
		})
		print("trophy unlocked")
		trophy_request

	if Global.rank > 29:
		var trophy_request = GameJoltAPI.add_achieved({
		 "username": GameJoltAPI.username,
		 "user_token": GameJoltAPI.user_token,
		 "trophy_id": "159532"
		})
		print("trophy unlocked")
		trophy_request

	if get_coins == true:
		coins.coins += ceil(rand_range(3, 12))
		coins.gold_coins += ceil(rand_range(0, 3))
		coins.save_settings()

	Global.xp += ceil(rand_range(20, 40))
	Global.save_settings()

func _on_into_menu_pressed():
	var add_score_request_EXP = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": Global.xp,
	"sort": Global.xp,
	"table_id": "710060"
	})
	add_score_request_EXP
	
	var add_score_request_fazcoins = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": coins.coins,
	"sort": coins.coins,
	"table_id": "699259"
	})
	add_score_request_fazcoins

	var add_score_request_goldcoins = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": coins.gold_coins,
	"sort": coins.gold_coins,
	"table_id": "709016"
	})
	add_score_request_goldcoins
	win_music.stop()
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_back_pressed():
	var add_score_request_EXP = GameJoltAPI.add_score({
	"username": GameJoltAPI.username,
	"user_token": GameJoltAPI.user_token,
	"score": Global.xp,
	"sort": Global.xp,
	"table_id": "710060"
	})
	add_score_request_EXP

	win_music.stop()
	win_screen.hide()
	jump.play("RESET")
	get_parent().get_node("Animatronic").can_move = true


