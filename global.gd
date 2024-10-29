extends Node2D

var level1Win = false
var level2win = false
var level3win = false
var lives = 2
var is_hurt = false
var startingLives = 2
var playerState = "Alive"
var total_time_seconds = 0
var totaldeaths = 0
var leveldeaths = 0
var all_level_time = 0
var levelSelect1 = false
var levelSelect2 = false
var levelSelect3 = false
var wizFlip = false
var slimeSpeed = 60


func _ready() -> void:
	
	print("Lives:")
	print(Global.lives)
