extends Drop


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity = Vector2(delta * Vel* 100, 0)
	
	var RAY: RayCast2D = $RayCast2D
	
	if RAY.is_colliding():
		var R_G = RAY.get_collider()
		
		if R_G.is_in_group("Zombie"):
			if R_G is Zombie:
				R_G.hit(DAMAGE)
				$CollisionShape2D.disabled = true
				visible = false
				$impact.play()
	

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func _on_impact_finished() -> void:
	queue_free()
	pass # Replace with function body.
