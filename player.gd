extends CharacterBody2D



var speed = 130.0
var jump_velocity = -300.0
@onready var animation_timer: Timer = $AnimationTimer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: CharacterBody2D = $"."


func _ready() -> void:
	Global.playerState = "Alive"
	print("Lives: " + str(Global.lives))
func _process(delta: float) -> void:
	if Global.is_hurt == false:
		player.collision_layer = 2
	
	
	
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		animation_player.play("jump")
		

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# PLay animations
	
	if Global.lives == 0:
		Global.lives = 0
		
		Global.playerState = "Dead"
		Global.is_hurt = false
		player.collision_layer = 4
		speed = 0
		jump_velocity = 0
		animated_sprite.play("dead")
		print("Lives: " + str(Global.lives))
	
	elif Global.is_hurt == true and Global.lives > 0:
		print("Lives: " + str(Global.lives))
		speed = 50
		jump_velocity = -130
		if animation_timer.is_stopped():
			animated_sprite.play("hurt")
			animation_timer.start()
			player.collision_layer = 4
			
	else:
		player.collision_layer = 2
		speed = 130
		jump_velocity = -300
		if  is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else: 
			animated_sprite.play("jumping")
	
		
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		Global.playerState = "Alive"
		CoinsCollected1.score = -1
		Global.is_hurt = false
		Engine.time_scale = 1.0
		
	if Input.is_action_just_pressed("menu"): 
		if  get_tree().current_scene.name != "level_win" or "win_screen":
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		
	
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func _on_animation_timer_timeout() -> void:
	Global.is_hurt = false
	speed = 130
	jump_velocity = -300
	
	player.collision_layer = 2
	print("Is hurt: " + str(Global.is_hurt))
	print("Lives: " + str(Global.lives))
	




	
