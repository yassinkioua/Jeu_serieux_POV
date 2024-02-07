extends Node2D

#Fonction pour generer le tp 
func tp_s_p(body):
	if body.get_class() == "CharacterBody2D":
		get_tree().change_scene_to_file("res://Carte/Principale/map.tscn")
