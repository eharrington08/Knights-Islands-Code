extends Button


# Called when the node enters the scene tree for the first time.
func _pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	Global.leveldeaths = 0
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
