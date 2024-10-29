extends Control

@onready var level_2_button: Button = $MarginContainer/Buttons/Level2Button
@onready var level_3_button: Button = $MarginContainer/Buttons/Level3Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_2_button.disabled = true
	level_3_button.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.level1Win == true:
		level_2_button.disabled = false
		Global.level1Win = true
		
	if Global.level2win == true:
		level_3_button.disabled = false
		Global.level2win = true
	
	if Input.is_action_just_pressed("Dev mode"):
		Global.level1Win = true
		Global.level2win = true


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	CoinsCollected1.score = -1
	


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	CoinsCollected1.score = -1


func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	CoinsCollected1.score = -1


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
