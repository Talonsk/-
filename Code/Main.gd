extends Node

@export var Platform: PackedScene


func _ready():
	$Start_spawn.start()
	
func _on_timer_timeout():
	
	var platform_spawn_location = get_node("PlatformPath/PlatformPathFollow")
	platform_spawn_location.progress_ratio = randf()
	
	for n in randf_range(0, 7):
		
		var platform = Platform.instantiate()
		
		platform.position = platform_spawn_location.position + Vector2(64 * n, 0)
		
		add_child(platform)
