extends Control

# Joue la vidéo 
func _ready():
	print($VideoStreamPlayer.size)
	$VideoStreamPlayer.play()


# Fonction pour skip les dialogues
func _process(_delta):
	if !$VideoStreamPlayer.is_playing() || Input.is_action_pressed("ui_right"):
		$TextureRect.visible= true
		$VideoStreamPlayer.visible = false
		if $TextureRect.visible :
			await get_tree().create_timer(0.1).timeout
			get_tree().change_scene_to_file("res://Carte/Principale/map.tscn")
