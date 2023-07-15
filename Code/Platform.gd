extends CharacterBody2D

@export var Money: PackedScene
@export var Trashcan: PackedScene
@onready var Main = $/root/Node

const SPEED = 80
var coins = 0
var is_stop_game = false
var chance_of_money = 70
var chance_of_trashchan = 5
var random_numger = randf_range(0, 101)

func _ready():
	var money_random_numger = randf_range(0, 101)
	if money_random_numger <= chance_of_money:
		var money = Money.instantiate()
		var change_position = Vector2(-16, 45)
		money.position = position - change_position
		add_child(money)
		
	if Main.is_have_trashcan:
		return
		
	var trashchan_random_numger = randf_range(0, 101)
	if trashchan_random_numger <= chance_of_trashchan:
		var trashchan = Trashcan.instantiate()
		var change_position = Vector2(-35, 0)
		trashchan.position = change_position
		add_child(trashchan)
		Main.is_have_trashcan = true
		
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
	if position.y >= 0:
		queue_free()
		
	move_and_slide()
