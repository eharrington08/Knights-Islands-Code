extends Node

@onready var wiz_text: Label = $"../Labels/wizText"

@onready var teleport_player: AnimationPlayer = $"../TeleportPlayer"
@onready var teleport_timer: Timer = $"../teleportTimer"
@onready var player: CharacterBody2D = $"../Player"
var maxCoins = 20
var coinsNeeded 
var wizEntered = false

func _ready() -> void:
	Global.wizFlip = false
	Global.slimeSpeed = 60
func _process(delta: float) -> void:
	update_label(CoinsCollected1.score)
	coinsNeeded = maxCoins - CoinsCollected1.score -1
	if Input.is_action_just_pressed("Open") and wizEntered == true and coinsNeeded <= 0:
			teleport_timer.start()
			print ("Pressed e")
			teleport_player.play("teleport")
	if not teleport_timer.is_stopped():
		player.scale -= Vector2(0.1,0.1)

func update_label(coins):
	coins +=1
	$"../UI/Control2/MarginContainer/ScoreLabel".text = str(coins)
	
		
func add_point():
	CoinsCollected1.score += 1
	print (CoinsCollected1.score)


func _on_wizard_body_entered(body: Node2D) -> void:
	wizEntered = true
	wiz_text.visible = true
	if coinsNeeded > 0:
		wiz_text.text = "You need " + str(coinsNeeded) + " more
		coins before you can
		go to the next level."
	elif coinsNeeded <= 0:
		wiz_text.text = "Press \"E\" to 
		teleport you to the
		next level!"


func _on_wizard_body_exited(body: Node2D) -> void:
	wiz_text.visible = false
	wizEntered = false


func _on_teleport_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/level_win.tscn")
	CoinsCollected1.score = -1
	Global.level2win = true
	Global.levelSelect2 = true
