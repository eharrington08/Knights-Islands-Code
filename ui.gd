extends CanvasLayer

@onready var heart_1: TextureRect = $Control2/MarginContainer/Hearts/Heart1
@onready var heart_2: TextureRect = $Control2/MarginContainer/Hearts/Heart2
@onready var texture_rect: Sprite2D = $Control2/MarginContainer/TextureRect


func _process(delta: float) -> void:
	
	if Global.lives == 1:
		heart_2.visible = false
	elif Global.lives == 0:
		heart_1.visible = false
	else:
		heart_2.visible = true
		heart_1.visible = true
