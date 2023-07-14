extends CharacterBody2D
class_name Trashcan
#@onready TrechMoney = $/root/Main/CharacterBody2D@_/Money

var SPEED = 80

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
	move_and_slide()


func _on_area_2d_body_entered(money : Money):
	money.pick_up()
