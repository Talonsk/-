extends CharacterBody2D

signal coins_changed

const SPEED = 300
const JUMP_VELOCITY = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var coins = 0


func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right") 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

func change_coins(diff : int):
	coins += diff
	emit_signal("coins_changed", coins)
	
func pick_up_money(money : Money):
	money.pick_up()
	change_coins(1)
	print(coins)
