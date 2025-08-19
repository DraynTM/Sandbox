extends Control

export var tutorial_finished = 0

var save_file = "user://tutorial.save" #файл сохранения
func save_settings(): 
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(tutorial_finished)
	file.close()

func load_settings(): 
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		tutorial_finished = file.get_var()
		file.close()
	else:
		tutorial_finished = 0

func _ready():
	load_settings()
	if tutorial_finished == 0:
		$AnimationPlayer.play("tutor")
		tutorial_finished = 1
		save_settings()

