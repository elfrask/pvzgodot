extends Node

var globals = {}

var SUNS = 100

func RESET_ROOM():
	SUNS = 100
	
	pass

func add(key: String, obj: Node):
	globals[key] = obj

func req(key: String):
	return globals.get(key, false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
