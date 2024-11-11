extends Node2D

@export var value: int = 50

signal on_take
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sun_mouse_entered() -> void:
	var ani: AnimationPlayer = $ani
	if ani.current_animation != "take":
		$ani.play("take")
		Game.SUNS += value
	pass # Replace with function body.

func _on_take():
	
	emit_signal("on_take", value)
	queue_free()
	pass
