extends Drop


func _ready():
	var a = randi_range(0, 100)
	
	velocity = Vector2((a-50)*0.1, 0)
	$ani.play("IDLE")
	pass

func _process(delta: float) -> void:
	
	velocity.x /= 2
	move_and_slide()


func _on_sun_on_take() -> void:
	queue_free()
	pass # Replace with function body.
