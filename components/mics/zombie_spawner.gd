extends Marker2D




var SCENE = preload("res://components/zombies/zombie.tscn")

@export var PatchSceneSpawn: NodePath


func spawn(type: int = 0, killtowin: bool = false):
	var _ss = get_node(PatchSceneSpawn)
	
	var inst: simpleZombie = SCENE.instantiate()
	inst.Type = type
	inst.killtowin = killtowin
	_ss.add_child(inst)
	inst.global_position = global_position
	
	pass
