extends CharacterBody2D
class_name Charecter

@export var Bag: PackedScene
@onready var Text = $/root/Node/CanvasLayer/MarginContainer/VBoxContainer/Massege

signal coins_changed

const SPEED = 300
const JUMP_VELOCITY = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var coins = 0
var is_stop_game = false

func _physics_process(delta):

	if not is_on_floor():
		velocity.y +=  delta * 200 + coins * 2
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
#	if position.y >= 0:
#		queue_free()
#		pass
	var direction = Input.get_axis("ui_left", "ui_right") 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func change_coins(diff : int):
	coins += diff
	#emit_signal("coins_changed", coins)
	
func pick_up_money(money : Money):
	money.pick_up()
	money.play_sound()
	var Colect_Audio = money.get_node("ASP_Collect")
	Colect_Audio.play()
	change_coins(1)
	Text.text = "Coins: " + str(coins)
	if coins == 10:
		check_money()
	
func check_money():
	var bag = Bag.instantiate() 
	var change_position = Vector2(-40,-200)
	bag.position = change_position
	bag.play_fall()
	print("Animation played")
	call_deferred("add_child", bag)
	$AnimatedSprite2D.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	get_tree().paused = true
