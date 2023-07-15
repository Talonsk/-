extends Node

@export var Platform: PackedScene

var is_have_trashcan = false
var is_have_banch = false
var is_have_fantein = false

var object_status = [is_have_trashcan, is_have_banch, is_have_fantein]


func _ready():
	$Start_spawn.start()

func _on_timer_timeout():
	var platform_spawn_location = get_node("PlatformPath/PlatformPathFollow")
	platform_spawn_location.progress_ratio = randf()
	
	for n in randf_range(1, 7):
		
		var platform = Platform.instantiate()
		
		platform.position = platform_spawn_location.position + Vector2(64 * n, 0)
		
		add_child(platform)
		
		if platform.position >= Vector2(1088, 0):
			platform.queue_free()
			
	for x in range(len(object_status)):
		object_status[x] = false
