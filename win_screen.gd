extends Control
@onready var level_3_label: Label = $level3label
@onready var total_deathlabel: Label = $totalDeathlabel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_3_label.text = "You beat Level 3 in: " + str(Global.total_time_seconds) + " seconds. \n \n And with " + str(Global.leveldeaths) + " deaths." 
	total_deathlabel.text = "You had " +str(Global.totaldeaths) + " deaths in total."

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
		Global.totaldeaths = 0
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		Global.totaldeaths = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
