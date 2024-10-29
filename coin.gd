extends Area2D


@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
# current_scene = get_tree().current_scene.name





func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	game_manager.add_point()
	
	
	
	
