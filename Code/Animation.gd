extends AnimatedSprite2D

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_up"):
		pass
	elif Input.is_action_pressed("ui_down"):
		pass
	elif Input.is_action_pressed("ui_right"):
		play("go_right")
	elif Input.is_action_pressed("ui_left"):
		play("go_left")
	else:
		play("stay")
	
	if get_tree().paused:
		play("stay")
