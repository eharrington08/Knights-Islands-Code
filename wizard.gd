extends Area2D

@onready var wizard: Area2D = $"."

@onready var speech_tip: Sprite2D = $SpeechTip
@onready var speech_box: Sprite2D = $SpeechBox


func _ready() -> void:
	speech_box.visible = false
	speech_tip.visible = false
	
func _process(delta: float) -> void:
	if Global.wizFlip == true:
		wizard.scale = Vector2(-1,1)
	else:
		Vector2(1,1)
	
func _on_body_entered(body: Node2D) -> void:
	speech_box.visible = true
	speech_tip.visible = true


func _on_body_exited(body: Node2D) -> void:
	speech_box.visible = false
	speech_tip.visible = false
	
