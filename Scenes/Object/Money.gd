extends Area2D

class_name Money

var is_picked_up := false

func pick_up():
	is_picked_up = true
	
func _on_Area2D_body_entered(body): # This is called when Area2D detects a collision
	queue_free()
