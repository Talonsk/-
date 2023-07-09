extends CharacterBody2D

@export var Money: PackedScene

const SPEED = 80
var coins = 0

func _ready():
	
	for n in randf_range(0, 2):
		if n:
			var money = Money.instantiate()
			var change_position = Vector2(-16, 45)
			money.position = position - change_position
			add_child(money)

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
		
	if position.y >= 0:
		queue_free()
		
	move_and_slide()
	

