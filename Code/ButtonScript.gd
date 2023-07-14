extends Button

@onready var ParentPanel = get_parent()

func _pressed():
	if get_tree().paused:
		ParentPanel.show()
		print(1)

func _on_pressed():
	get_tree().paused = false
	
