extends CharacterBody2D

@onready var sprite_2d = $Sprite2D
@onready var data = get_node("/root/Data")
@onready var princi = get_node("/root/VarPrinci")
var player = null
var chase = false
var end = false
func _ready():
	sprite_2d.play()

func _process(_delta):
	if princi.isFightingA && end == false:
		if chase:
			position += (player.position - position) / 600
			if princi.isHitting:
				sprite_2d.play('red_back')
				await get_tree().create_timer(0.4).timeout
				princi.bad_end()
				end = true
				
func _on_fight_body_entered(body):
	player = body 
	chase = true

func _on_fight_body_exited(_body):
	player = null
	chase = false
