tool
extends Node2D
export var hat = 0
export var head = 0
export var body = 0
export var legs = 0
export var ability = 5
export var extra_ability = 0
export var color_hat = -261
export var color_eyes = 11111111
export var color_eyes2 = -288
export var color_head = -261
export var color_body = -261
export var color_legs = -261
var save_file = "user://fnafsandbox_character.save" #файл сохранения

func save_settings(): #сохранение персонажа
	var file = File.new()
	file.open(save_file, File.WRITE)
	file.store_var(color_head)
	file.store_var(color_body)
	file.store_var(color_legs)
	file.store_var(color_hat)
	file.store_var(color_eyes)
	file.store_var(color_eyes2)
	file.store_var(head)
	file.store_var(body)
	file.store_var(legs)
	file.store_var(hat)
	file.store_var(ability)
	file.store_var(extra_ability)
	file.close()

func load_settings(): #загрузка персонажа
	var file = File.new()
	if file.file_exists(save_file):
		file.open(save_file, File.READ)
		color_head = file.get_var()
		color_body = file.get_var()
		color_legs = file.get_var()
		color_hat = file.get_var()
		color_eyes = file.get_var()
		color_eyes2 = file.get_var()
		head = file.get_var()
		body = file.get_var()
		legs = file.get_var()
		hat = file.get_var()
		ability = file.get_var()
		extra_ability = file.get_var()
		file.close()
	else:
		color_head = -261
		color_body = -261
		color_legs = -261
		color_hat = -261
		color_eyes = 1256
		color_eyes2 = -288
		head = 0
		body = 0
		legs = 0
		hat = 0
		ability = 0
		extra_ability = 0

func _ready():
	load_settings() 

func _process(delta):
	coloring() 
	hat_type()
	head_type()
	body_type()
	legs_type()
	abilities()
	extra_abilities()
	#print(extra_ability)

func coloring():
	get_parent().get_node("Bodys").modulate = color_body
	get_parent().get_node("Heads").modulate = color_head
	get_parent().get_node("Hats").modulate = color_hat
	get_parent().get_node("Eyes/1").modulate = color_eyes
	get_parent().get_node("Eyes/2").modulate = color_eyes2
	get_parent().get_node("Legs").modulate = color_legs
	pass

func hat_type():
	if hat == 0:
		hide_all_hats()
	if hat == 1:
		hide_all_hats()
		get_parent().get_node("Hats/Hat").show()
	if hat == 2:
		hide_all_hats()
		get_parent().get_node("Hats/Hat2").show()
	if hat == 3:
		hide_all_hats()
		get_parent().get_node("Hats/Hat3").show()
	if hat == 4:
		hide_all_hats()
		get_parent().get_node("Hats/Hat4").show()
	if hat == 5:
		hide_all_hats()
		get_parent().get_node("Hats/Hat5").show()
	if hat == 6:
		hide_all_hats()
		get_parent().get_node("Hats/Hat6").show()
	if hat == 7:
		hide_all_hats()
		get_parent().get_node("Hats/Hat7").show()

func head_type():
	if head == 0:
		hide_all_heads()
		get_parent().get_node("Heads/Head").show()
		get_parent().get_node("Eyes").show()
	if head == 1:
		hide_all_heads()
		get_parent().get_node("Heads/Head2").show()
		get_parent().get_node("Eyes").show()
	if head == 2:
		hide_all_heads()
		get_parent().get_node("Heads/Head3").show()
		get_parent().get_node("Eyes").show()
	if head == 3:
		hide_all_heads()
		get_parent().get_node("Heads/Head4").show()
		get_parent().get_node("Eyes").show()
	if head == 4:
		hide_all_heads()
		get_parent().get_node("Heads/Head5").show()
		get_parent().get_node("Eyes").hide()
	if head == 5:
		hide_all_heads()
		get_parent().get_node("Heads/Head6").show()
		get_parent().get_node("Eyes").show()
	if head == 6:
		hide_all_heads()
		get_parent().get_node("Heads/Head7").show()
		get_parent().get_node("Eyes").show()
	if head == 7:
		hide_all_heads()
		get_parent().get_node("Heads/Head8").show()
		get_parent().get_node("Eyes").show()
	if head == 8:
		hide_all_heads()
		get_parent().get_node("Heads/Head9").show()
		get_parent().get_node("Eyes").show()
	if head == 9:
		hide_all_heads()
		get_parent().get_node("Heads/Head10").show()
		get_parent().get_node("Eyes").show()
	if head == 10:
		hide_all_heads()
		get_parent().get_node("Heads/Head11").show()
		get_parent().get_node("Eyes").show()
	if head == 11:
		hide_all_heads()
		get_parent().get_node("Heads/Head12").show()
		get_parent().get_node("Eyes").show()
	if head == 12:
		hide_all_heads()
		get_parent().get_node("Heads/Head13").show()
		get_parent().get_node("Eyes").show()
	if head == 13:
		hide_all_heads()
		get_parent().get_node("Heads/Head14").show()
		get_parent().get_node("Eyes").show()
	if head == 14:
		hide_all_heads()
		get_parent().get_node("Heads/Head15").show()
		get_parent().get_node("Eyes").show()
	if head == 15:
		hide_all_heads()
		get_parent().get_node("Heads/Head16").show()
		get_parent().get_node("Eyes").show()
	if head == 16:
		hide_all_heads()
		get_parent().get_node("Heads/Head17").show()
		get_parent().get_node("Eyes").show()
	if head == 17:
		hide_all_heads()
		get_parent().get_node("Heads/Head18").show()
		get_parent().get_node("Eyes").show()
	if head == 18:
		hide_all_heads()
		get_parent().get_node("Heads/Head19").show()
		get_parent().get_node("Eyes").show()
	if head == 19:
		hide_all_heads()
		get_parent().get_node("Heads/Head20").show()
		get_parent().get_node("Eyes").show()

func body_type():
	if body == 0:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body").show()
	if body == 1:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body2").show()
	if body == 2:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body3").show()
	if body == 3:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body4").show()
	if body == 4:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body5").show()
	if body == 5:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body6").show()
	if body == 6:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body7").show()
	if body == 7:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body8").show()
	if body == 8:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body9").show()
	if body == 9:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body10").show()
	if body == 10:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body11").show()
	if body == 11:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body12").show()
	if body == 12:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body13").show()
	if body == 13:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body14").show()
	if body == 14:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body15").show()
	if body == 15:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body16").show()
	if body == 16:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body17").show()
	if body == 17:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body18").show()
	if body == 18:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body19").show()
	if body == 19:
		hide_all_bodies()
		get_parent().get_node("Bodys/Body20").show()

func legs_type():
	if legs == 0:
		hide_all_legs()
		get_parent().get_node("Legs/Leg").show()
	if legs == 1:
		hide_all_legs()
		get_parent().get_node("Legs/Leg2").show()
	if legs == 2:
		hide_all_legs()
		get_parent().get_node("Legs/Leg3").show()
	if legs == 3:
		hide_all_legs()
		get_parent().get_node("Legs/Leg4").show()
	if legs == 4:
		hide_all_legs()
		get_parent().get_node("Legs/Leg5").show()
	if legs == 5:
		hide_all_legs()
		get_parent().get_node("Legs/Leg6").show()

func abilities():
	if ability == 5:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/speed2.png")
	if ability == 0:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/awareness.png")
	if ability == 1:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/speed.png")
	if ability == 2:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/speed5x.png")
	if ability == 3:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/teleport.png")
	if ability == 4:
		get_parent().get_node("HUD/Abilities/Icon").texture = preload("res://Sprites/character_editor/abilities/mouse.png")
	pass

func extra_abilities():
	if extra_ability == 0:
		get_parent().get_node("HUD/Abilities/Icon2").hide()
	if extra_ability == 1:
		get_parent().get_node("HUD/Abilities/Icon2").show()
		get_parent().get_node("HUD/Abilities/Icon2").texture = preload ("res://Sprites/character_editor/abilities/binocle.png")
	if extra_ability == 2:
		get_parent().get_node("HUD/Abilities/Icon2").show()
		get_parent().get_node("HUD/Abilities/Icon2").texture = preload ("res://Sprites/character_editor/abilities/wings.png")
	if extra_ability == 3:
		get_parent().get_node("HUD/Abilities/Icon2").show()
		get_parent().get_node("HUD/Abilities/Icon2").texture = preload ("res://Sprites/character_editor/abilities/guitar.png")
	if extra_ability == 4:
		get_parent().get_node("HUD/Abilities/Icon2").show()
		get_parent().get_node("HUD/Abilities/Icon2").texture = preload ("res://Sprites/character_editor/abilities/halloween.png")
	pass

func hide_all_heads():
	get_parent().get_node("Heads/Head").hide()
	get_parent().get_node("Heads/Head2").hide()
	get_parent().get_node("Heads/Head3").hide()
	get_parent().get_node("Heads/Head4").hide()
	get_parent().get_node("Heads/Head5").hide()
	get_parent().get_node("Heads/Head").hide()
	get_parent().get_node("Heads/Head2").hide()
	get_parent().get_node("Heads/Head3").hide()
	get_parent().get_node("Heads/Head4").hide()
	get_parent().get_node("Heads/Head5").hide()
	get_parent().get_node("Heads/Head6").hide()
	get_parent().get_node("Heads/Head7").hide()
	get_parent().get_node("Heads/Head8").hide()
	get_parent().get_node("Heads/Head9").hide()
	get_parent().get_node("Heads/Head10").hide()
	get_parent().get_node("Heads/Head11").hide()
	get_parent().get_node("Heads/Head12").hide()
	get_parent().get_node("Heads/Head13").hide()
	get_parent().get_node("Heads/Head14").hide()
	get_parent().get_node("Heads/Head15").hide()
	get_parent().get_node("Heads/Head16").hide()
	get_parent().get_node("Heads/Head17").hide()
	get_parent().get_node("Heads/Head18").hide()
	get_parent().get_node("Heads/Head19").hide()
	get_parent().get_node("Heads/Head20").hide()
	pass

func hide_all_bodies():
	get_parent().get_node("Bodys/Body").hide()
	get_parent().get_node("Bodys/Body2").hide()
	get_parent().get_node("Bodys/Body3").hide()
	get_parent().get_node("Bodys/Body4").hide()
	get_parent().get_node("Bodys/Body5").hide()
	get_parent().get_node("Bodys/Body6").hide()
	get_parent().get_node("Bodys/Body7").hide()
	get_parent().get_node("Bodys/Body8").hide()
	get_parent().get_node("Bodys/Body9").hide()
	get_parent().get_node("Bodys/Body10").hide()
	get_parent().get_node("Bodys/Body11").hide()
	get_parent().get_node("Bodys/Body12").hide()
	get_parent().get_node("Bodys/Body13").hide()
	get_parent().get_node("Bodys/Body14").hide()
	get_parent().get_node("Bodys/Body15").hide()
	get_parent().get_node("Bodys/Body16").hide()
	get_parent().get_node("Bodys/Body17").hide()
	get_parent().get_node("Bodys/Body18").hide()
	get_parent().get_node("Bodys/Body19").hide()
	get_parent().get_node("Bodys/Body20").hide()

func hide_all_legs():
	get_parent().get_node("Legs/Leg").hide()
	get_parent().get_node("Legs/Leg2").hide()
	get_parent().get_node("Legs/Leg3").hide()
	get_parent().get_node("Legs/Leg4").hide()
	get_parent().get_node("Legs/Leg5").hide()
	get_parent().get_node("Legs/Leg6").hide()

func hide_all_hats():
	get_parent().get_node("Hats/Hat").hide()
	get_parent().get_node("Hats/Hat2").hide()
	get_parent().get_node("Hats/Hat3").hide()
	get_parent().get_node("Hats/Hat4").hide()
	get_parent().get_node("Hats/Hat5").hide()
	get_parent().get_node("Hats/Hat6").hide()
	get_parent().get_node("Hats/Hat7").hide()
	pass
