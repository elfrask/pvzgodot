extends Node2D

@export var value: int = 50

signal on_take



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
