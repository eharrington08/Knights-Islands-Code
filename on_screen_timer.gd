extends Control
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2



		
#func _ready() -> void:
	#timer.start()
	#print("Timer Started")
	

func _ready() -> void:
	if get_tree().current_scene.name == "level_1":
		Global.total_time_seconds = 0
		timer.start()
	elif get_tree().current_scene.name == "level_2" or "level_3":
		Global.total_time_seconds = 0
		timer.start()



func _on_timer_timeout() -> void:
	print(Global.total_time_seconds)
	Global.total_time_seconds += 1
	var m = int(Global.total_time_seconds / 60)
	var s = Global.total_time_seconds - m * 60
	
	label.text = "%02d : %02d" % [m, s]


func _on_timer_2_timeout() -> void:
	print ("Full Level time: " + str(Global.all_level_time))
	Global.all_level_time += 1
