extends Node2D
@onready var escape_menu: Control = %EscapeMenu


# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("menu"):  # If the escape key is pressed
		if get_tree().paused:
			resume_game()  # Unpause the game if it's already paused
		else:
			pause_game()  # Pause the game and show the menu if it's running

func pause_game() -> void:
	get_tree().paused = true
	escape_menu.show() 
	hide() # Show the escape menu

func resume_game() -> void:
	get_tree().paused = false
	escape_menu.hide() 
	show()
