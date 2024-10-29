extends Area2D

@onready var level_3_manager: Node = %Level3Manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	level_3_manager.add_point()
	animation_player.play("pickup")
	
