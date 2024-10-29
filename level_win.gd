extends Control

@onready var timer_label: Label = $timerLabel

func _ready() -> void:
	timer_label.text = "You won in: " + str(Global.total_time_seconds) + " seconds. \n \n And with " + str(Global.leveldeaths) + " deaths." 
	
func _on_next_level_button_pressed() -> void:
	if Global.level2win == false and Global.level1Win == true or Global.levelSelect1 == true:
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
		Global.levelSelect1 = false
	elif Global.level2win == true and Global.level3win == false or Global.levelSelect2 == true:
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
		Global.levelSelect2 = false
	Global.leveldeaths = 0
	


func _on_level_select_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	Global.leveldeaths = 0
