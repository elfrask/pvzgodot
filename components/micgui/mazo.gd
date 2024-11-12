@tool
extends HBoxContainer
class_name Mazo

@export var index: int = 0
var value = null

signal on_change

func _on_change(val: PackedScene):
	
	emit_signal("on_change", val)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var childs = get_children()
	var IDS = 0
	
	for i in childs:
		if i is Card:
			i.ID = IDS
			IDS +=1
			pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
