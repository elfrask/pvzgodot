@icon("./zombie.png")
#@tool
extends CharacterBody2D
class_name Zombie

signal on_die

@export_node_path("AnimationPlayer") var AniPath
@export_node_path("RayCast2D") var RayDetectionPath

@export var Healt = 1000
@export var Damage = 100
@export var Vel = 100
@export var only_idle = false
@export var killtowin = false


var Plant

func remove():
	queue_free()

func hit(damge: int):
	var ani:AnimationPlayer = get_node(AniPath)
	Healt -= damge
	print("daño")
	if Healt < 1:
		ani.play("DIE")
		collision_layer = 0
		collision_mask = 0
		emit_signal("on_die", self)
		
		var level = Game.req("level")
		if killtowin:
			if level:
				level.win()
		
	pass

func _ani_finish(ani_name: String):
	var ani:AnimationPlayer = get_node(AniPath)
	
	match ani_name:
		"ATK":
			if Plant is Plants:
				Plant.hit(Damage)
			ani.play("ATK")
			pass
		_:
			
			pass
		pass
	
	#print("ani finish:", ani_name)
	pass

func _ready() -> void:
	var ani:AnimationPlayer = get_node(AniPath)
	ani.connect("animation_finished", _ani_finish)
	ani.play("IDLE")
	pass

func _eat(Obj: Plants):
	
	Plant = Obj


func _process(delta: float) -> void:
	var ani: AnimationPlayer = get_node(AniPath)
	var RayDerection: RayCast2D = get_node(RayDetectionPath)
	
	match ani.current_animation:
		"RESET":
			pass
		"IDLE":
			if not only_idle:
				ani.play("WALK")
			pass
		"WALK":
			if RayDerection.is_colliding():
				var RayObjectDetection:Node = RayDerection.get_collider()
				if RayObjectDetection.is_in_group("Plants"):
					_eat(RayObjectDetection)
					ani.play("ATK")
			velocity.x = -(delta * Vel * 10)
			move_and_slide()
			pass
		"ATK":
			var _stop = false
			if RayDerection.is_colliding():
				var RayObjectDetection:Node = RayDerection.get_collider()
				if not RayObjectDetection.is_in_group("Plants"):
					_stop = true
			else:
				_stop = true
			
			if _stop:
				ani.play("WALK")
			pass
		_:
			
			pass
	
	
	pass
