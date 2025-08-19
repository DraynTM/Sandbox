extends Control

var path
var mods = {}
var dir = Directory.new()
var file_name
func _ready():
	dir_contents()
	pass

func dir_contents():
	path = "res://mods/" #mods folder path | путь папки с модами
	if dir.open(path) == OK:
		dir.list_dir_begin()
		file_name = dir.get_next()
		while file_name != "":
			if ".pck" in file_name:
				$ItemList.add_item(path + file_name)
				#var path_string = "%s//%s" % path % file_name
				#mods[file_name] = load(path_string)
				print("Found file: " + path + file_name)
			file_name = dir.get_next()

func _process(delta):
	pass

func _on_APPLY_pressed():
	pass

func _on_ItemList_item_selected(index):
	print($ItemList.get_item_text(index))
	$Sound.play()
	$MDS.show()
	$MDS.text = "MOD SELECTED: " + str($ItemList.get_item_text(index))
	#ProjectSettings.load_resource_pack($ItemList.get_item_text(index)) #замена оригинального .pck файла, на модифицированный
