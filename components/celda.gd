extends Control
class_name celda

@onready var touch:TextureButton = $touch
@onready var spawn:Marker2D = $spawn
@onready var spawnPoint:Node2D = $spawnPoint

#var lanzaguizantes: PackedScene = preload("res://components/plants/lanzaguizantes.tscn")
var lanzaguizantes: PackedScene = preload("res://components/plants/girasol.tscn")
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
	if not PLANT: 
		var inst:Plants = lanzaguizantes.instantiate()
		spawnPoint.add_child(inst)
		inst.CELDA = self
		PLANT = true
	
	#Plants.global_position = pos
	
	pass # Replace with function body.
