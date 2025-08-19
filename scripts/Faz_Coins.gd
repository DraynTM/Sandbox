tool
extends Node2D

var save_file = "user://fnafsandbox-coins.save" #файл сохранения
export var coins = 0 #фаз коины
export var gold_coins = 0 #голд коины
func save_settings(): #сохранение коинов
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(coins)
	file.store_var(gold_coins)
	file.close()

func load_settings(): #загрузка коинов
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		coins = file.get_var()
		gold_coins = file.get_var()
		file.close()
	else:
		coins = 0
		gold_coins = 0

func _process(delta):
	load_settings()
	$Faz_Counter.text = str(coins) #вывод кол-во коинов
	$Gold_Coins/Faz_Counter.text = str(gold_coins) #вывод кол-во коинов
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
