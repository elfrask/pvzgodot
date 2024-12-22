@icon("./zombie.png")
extends Zombie
class_name simpleZombie

enum TypeZombie {
	NORMAL,
	CONO,
	CUBETA
}

@export var Type: TypeZombie = TypeZombie.NORMAL
@export var silent = false

func _ready() -> void:
	
	if silent:
		$brains.stop()
	
	var _hat = $hat
	var _cono = $hat/cono
	var _cubeta = $hat/cube
	
	_hat.visible = true
	_cono.visible = false
	_cubeta.visible = false
	
	match Type:
		TypeZombie.NORMAL:
			_hat.visible = false
			Healt = 1000
			pass
		TypeZombie.CONO:
			_hat.visible = true
			_cono.visible = true
			Healt = 2000
			pass
		TypeZombie.CUBETA:
			_hat.visible = true
			_cubeta.visible = true
			Healt = 3500
			pass
		
	
	
	super()

func _process(delta: float) -> void:
	super(delta)
	
	$hat.visible = Healt > 1000

@onready var BRAINS = [$brains1, $brains2]

func _on_brains_timeout() -> void:
	var _rs = randi_range(0, 5)
	
	if _rs == 3:
		var _tr = randi_range(0, 1)
		var _br = BRAINS[_tr]
		
		_br.play()
	pass # Replace with function body.


func _on_on_die() -> void:
	$brains.stop()
	pass # Replace with function body.
