extends Node2D

var sun = preload("res://components/drops/fall_sun.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.RESET_ROOM()
	Game.add("drops", $drops)
	Game.add("level", self)
	$level.play("level")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func win():
	$bg.stop()
	$win.play()
	$level_o.play("win")
	
	
	pass

func gameover():
	$bg.stop()
	$gameover.play()
	$level_o.play("gameover")
	
	pass

func _on_timer_timeout() -> void:
	var start: Marker2D = $suns_fall/start
	var end: Marker2D = $suns_fall/end
	
	var pos = randi_range(start.global_position.x, end.global_position.x)
	
	var inst: Node2D = sun.instantiate()
	
	inst.global_position = Vector2(pos, start.global_position.y)
	
	$suns_fall.add_child(inst)
	
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://components/MAINMENU.tscn")
	pass # Replace with function body.


func _on_house_body_entered(body: Node2D) -> void:
	if (body is Zombie) or (body is simpleZombie):
		gameover()
	pass # Replace with function body.
