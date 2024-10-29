extends Control

@onready var play_button: Button = $MarginContainer/Buttons/PlayButton
 
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Dev mode"):
		Global.level1Win = true
		Global.level2win = true


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
