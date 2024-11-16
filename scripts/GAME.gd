extends Node

var globals = {}

var SUNS = 100
var PLANT:PackedScene = load("res://components/plants/lanzaguizantes.tscn")

func RESET_ROOM():
	SUNS = 100
	PLANT = load("res://components/plants/lanzaguizantes.tscn")
	pass

func add(key: String, obj: Node):
	globals[key] = obj

func req(key: String):
	return globals.get(key, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
