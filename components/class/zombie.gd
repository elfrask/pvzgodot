@icon("./zombie.png")
@tool
extends CharacterBody2D
class_name Zombie

@export_node_path("AnimationPlayer") var AniPath
@export var Healt = 1000
@export var Damage = 100
@export var Vel = 100


func _ready() -> void:
	var ani:AnimationPlayer = get_node(AniPath)
	
	ani.play("IDLE")
	pass

func _process(delta: float) -> void:
	var ani:AnimationPlayer = get_node(AniPath)
	
	
	pass
