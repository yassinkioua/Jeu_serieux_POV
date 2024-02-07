extends StaticBody2D

@onready var sprite = $AnimatedSprite2D
@onready var data = get_node("/root/Data")
func _ready():
	sprite.play()
