@icon("./plant_icon.png")
#@tool
extends CharacterBody2D
class_name Plants


@export_node_path("AnimationPlayer") var ANIMATED_SPRITE_PATH:NodePath
@export_node_path("Marker2D") var SHOOT_SPAWN_PATH:NodePath
@export var icon:Texture
@export var DropOrBullet: PackedScene
@export var Price = 100
@export var Healt = 300
@export var DAMAGE:int = 100
@export var USE_RAY_SHOOT: bool = true
#@export var s = 0
#@export var ANIMATED_SPRITE_PATH:NodePath
var CELDA: celda = null
@onready var RAY = $ray

func hit(damge: int):
	Healt -= damge
	print("daño")
	if Healt < 1:
		if CELDA:
			CELDA.PLANT = false
		queue_free()
	pass

func _ready() -> void:
	var ani:AnimationPlayer = get_node(ANIMATED_SPRITE_PATH)
	
	ani.play("IDLE")
func shoot():
	var ani:AnimationPlayer = get_node(ANIMATED_SPRITE_PATH)
	ani.play("SHOOT")
	
	pass

func drop():
	var SpawnDrop:Marker2D = get_node(SHOOT_SPAWN_PATH)
	var _drop:Drop = DropOrBullet.instantiate()
	var gt:Node2D = Game.req("drops")
	
	gt.add_child(_drop)
	_drop.global_position = SpawnDrop.global_position
	_drop.DAMAGE = DAMAGE
	
	pass

func _process(_delta: float) -> void:
	
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
