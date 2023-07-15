extends CharacterBody2D

@onready var charecter = $/root/Node/Charecter
@onready var Text = $/root/Node/CanvasLayer/MarginContainer/VBoxContainer/Massege

var SPEED = 80
var is_press_e = false
var change_coins = -2

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
	
	if charecter.coins <= 1:
		return
		
	if Input.is_action_pressed("ui_e") and is_press_e:
		charecter.change_coins(change_coins)
		$AnimatedSprite2D.play("filling of gold")
		Text.text = "Coins: " + str(charecter.coins)
		is_press_e = false
	move_and_slide()
	
#func _coin_entered(money : Money):
#	money.pick_up()

func _charecter_entered(charecter):
	$Label.visible = true
	is_press_e = true

func play_sound():
	$ASP_Collect.play()
