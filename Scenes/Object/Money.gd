extends CharacterBody2D

class_name Money

var SPEED = 80

var is_picked_up := false

func pick_up():
	is_picked_up = true
	queue_free()

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
	move_and_slide()

func play_sound():
	$ASP_Collect.play()
