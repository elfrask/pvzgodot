@icon("./plant_icon.png")
@tool
extends CharacterBody2D
class_name Plants




@export_node_path("AnimationPlayer") var ANIMATED_SPRITE_PATH:NodePath
@export var Healt = 300
@export var DAMAGE:int = 100
@export var USE_RAY_SHOOT: bool = true
#@export var s = 0
#@export var ANIMATED_SPRITE_PATH:NodePath

@onready var RAY = $ray

func _ready() -> void:
	var ani:AnimationPlayer = get_node(ANIMATED_SPRITE_PATH)
	
	ani.play("IDLE")
func shoot():
	var ani:AnimationPlayer = get_node(ANIMATED_SPRITE_PATH)
	ani.play("SHOOT")
	
	pass

func _physics_process(delta: float) -> void:
	
	var ani:AnimationPlayer = get_node(ANIMATED_SPRITE_PATH)
	
	match ani.current_animation:
		"IDLE":
			if USE_RAY_SHOOT:
				if RAY.is_colliding():
					var obj:Node = RAY.get_collider()
					if obj.is_in_group("Zombie"):
						shoot()
						pass
					pass
				pass
			
			pass
		"RESET":
			ani.play("IDLE")
			
			pass
		"SHOOT":
			
			pass
		_:
			ani.play("RESET")
			pass
	
	
	pass
