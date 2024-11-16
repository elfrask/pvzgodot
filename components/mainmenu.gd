extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ani.play("IDLE")
	$oneani.play("play")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://components/LEVELSTATE.tscn")
		pass
	pass
