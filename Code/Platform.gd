extends CharacterBody2D

@export var Money: PackedScene

const SPEED = 100

func _ready():
	
	var money_spawn_location = get_node("MoneyPath/MoneyPathFollow")
	money_spawn_location.progress_ratio = randf()
	
	for n in randf_range(0, 2):
		if n:
			var money = Money.instantiate()
			var change_position = Vector2(-16, 45)
			print( money_spawn_location.position)
			money.position = money_spawn_location.position - change_position
			add_child(money)

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = SPEED
		
	if velocity.y >= 20000:
		queue_free()
		
	move_and_slide()
