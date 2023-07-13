extends CharacterBody2D

@export var Money: PackedScene

const SPEED = 80
var coins = 0
var is_stop_game = false

func _ready():
	
	var random_numger = randf_range(0, 101)
	if random_numger >= 30:
		var money = Money.instantiate()
		var change_position = Vector2(-16, 45)
		money.position = position - change_position
		add_child(money)

func _physics_process(delta):
	
	if is_stop_game:
		#print(1)
		return
	if not is_on_floor():
		velocity.y = SPEED
	if position.y >= 0:
		queue_free()
		
	move_and_slide()
