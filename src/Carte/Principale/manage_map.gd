extends Node2D

var next_scene = 0
@onready var scenario_stade = $map/Scenario_stade
@onready var data = get_node("/root/Data")

#Fonction pour le tp vers le bureau
func _on_tp_p_b_body_entered(body):
	next_scene = 1
	if body.get_class() == "CharacterBody2D" && data.scenario_end_stade:
		$map/TransitionScreen.visible = true
		$map/TransitionScreen.transition()
		
#Fonction pour le tp vers la salle de sport
func _on_tp_p_sds_body_entered(body):
	next_scene = 2
	if body.get_class() == "CharacterBody2D" && data.scenario_end_stade && data.scenario_end_bureau:
		$map/TransitionScreen.visible = true
		$map/TransitionScreen.transition()

# Fonction pour changer de scène
func _on_transition_screen_transitionned():
	if next_scene == 1:
		get_tree().change_scene_to_file("res://Carte/Bureau/bureau.tscn")
	elif next_scene == 2:
		get_tree().change_scene_to_file("res://Carte/Sds/sds.tscn")

#Fonction pour le tp quand du bureau 
func _on_tp_p_b_body_exited(_body):
	$map/TransitionScreen.visible = false

#Fonction pour le tp quand on sort de la salle de sport
func _on_tp_p_sds_body_exited(_body):
	$map/TransitionScreen.visible = false
