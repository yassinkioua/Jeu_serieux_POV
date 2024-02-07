extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var data = get_node("/root/Data")
@onready var princi = get_node("/root/VarPrinci")

var player = null
var chase = false
var end = false

func _ready():
	animated_sprite_2d.play('front')

func _process(_delta):
	if princi.isFightingB && end == false:
		if chase:
			position += (player.position - position) / 600
			if princi.isHitting:
				animated_sprite_2d.play('red_front')
				await get_tree().create_timer(0.4).timeout
				princi.bad_end()
				end = true
				
func _on_fight_body_entered(body):
	player = body 
	chase = true

func _on_fight_body_exited(_body):
	player = null
	chase = false
