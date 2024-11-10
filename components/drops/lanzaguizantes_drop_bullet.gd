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
				queue_free()
	

	move_and_slide()
