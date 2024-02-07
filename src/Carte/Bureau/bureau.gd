extends Node2D

@onready var scenario_bureau = $TileMap/Scenario_bureau

#Fonction pour gerer le TP
func _on_tp_b_p_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		get_tree().change_scene_to_file("res://Carte/Principale/map.tscn")
