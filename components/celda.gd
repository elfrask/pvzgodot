extends Control
class_name celda

@onready var touch:TextureButton = $touch
#@onready var spawn:Marker2D = $spawn
@onready var spawnPoint:Node2D = $spawnPoint

#var lanzaguizantes: PackedScene = preload("res://components/plants/lanzaguizantes.tscn")
var Planta: PackedScene = Game.PLANT
var PLANT = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#touch.visible = false
	pass # Replace with function body.


func _on_touch_mouse_entered() -> void:
	print("pos:", global_position)
	
	pass # Replace with function body.


func _on_touch_pressed() -> void:
	#var pos = spawn.global_position
	Planta = Game.PLANT
	if not PLANT:
		var inst:Plants = Planta.instantiate()
		if inst.Price <= Game.SUNS:
			spawnPoint.add_child(inst)
			inst.CELDA = self
			Game.SUNS -= inst.Price
			PLANT = true
	
	#Plants.global_position = pos
	
	pass # Replace with function body.
