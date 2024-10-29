extends Area2D



@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var hearts

func _ready() -> void:
	Global.lives = Global.startingLives
	hearts = Global.startingLives
	
func _on_body_entered(body: Node2D):
	damage_player()
	
	
	print("Hearts")
	print(hearts)
	print("Is Hurt:")
	print (Global.is_hurt)
	
	
	
	if Global.lives > 0:
		print ("OW!!")
		Global.is_hurt = true
	elif Global.lives <= 0 :
		Global.leveldeaths += 1
		Global.totaldeaths += 1
		print("You Died")
		
		Engine.time_scale = 0.5
		##body.get_node("CollisionShape2D").queue_free()
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	Global.lives = Global.startingLives
	CoinsCollected1.score = -1
	Global.is_hurt = false
	
func damage_player():
	animation_player.play("hurt")
	hearts -= 1
	Global.lives -= 1
