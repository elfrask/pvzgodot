@tool
extends Control
class_name Card

#@export var price: int:
	#set(value):
		#$TextureRect/Label.text = str(value)
		#price = value
		#pass
#@export var icon: Texture:
	#set(value):
		#$TextureRect/icon.texture = value
		#icon = value
		#pass
@export var Scene: PackedScene:
	set(value):
		Scene = value
		var inst: Plants = value.instantiate()
		#print(inst)
		$bt/Label.text = str(inst.Price)
		$bt/icon.texture = inst.icon

var ID = -1

func _set_plant(value: PackedScene):
	Scene = value
	var inst: Plants = value.instantiate()
	$bt/Label.text = str(inst.Price)
	$bt/icon.texture = inst.icon
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$TextureRect/Label.text = price
	
	var parent = get_parent()
	
	if parent is Mazo:
		$bg.visible =  parent.index == ID
		pass
	
	pass


func _on_texture_rect_pressed() -> void:
	var parent = get_parent()
	
	if parent is Mazo:
		parent.index = ID
		parent._on_change(Scene)
		pass
	pass # Replace with function body.
