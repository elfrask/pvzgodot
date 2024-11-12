extends Drop




func _physics_process(delta: float) -> void:
	
	velocity = Vector2(0, 5000 * delta)

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func _on_sun_on_take() -> void:
	queue_free()
	pass # Replace with function body.
