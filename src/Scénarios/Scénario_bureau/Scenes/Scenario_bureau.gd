extends Node2D

@onready var princi = get_node("/root/VarPrinci")
@onready var data = get_node("/root/Data")
# Cas de scénario
var scenario_bureau = [
	"s2_c1", "s2_c2"
]

#Fonction qui génère le cas de scénario aléatoirement
func _ready():
	if data.scenario_end_bureau == false:
		princi.isFighting = false
		princi.isFightingA = false
		princi.isFightingB = false
		data.scenario_end = false
		princi.count = 0
		randomize() 
		var index = randi() % scenario_bureau.size()
		var selected_scenario = scenario_bureau[index]
		generate_child(selected_scenario)
		data.update_chosen_case(selected_scenario)
	else:
		queue_free()
	
# Fonction pour générer les perso de scénario en fonction de la valeur que nous renvoie le ramdom dans ma fonction précédante
func generate_child(selected_scenario):
	if selected_scenario == "s2_c1":
		var mike_scene = preload("res://Scénarios/Scénario_bureau/Actor_office/Case 1/Mike/mike.tscn")
		var thomas_scene = preload("res://Scénarios/Scénario_bureau/Actor_office/Case 1/Thomas/Thomas.tscn")
		var mike_instance = mike_scene.instantiate()
		var thomas_instance = thomas_scene.instantiate()
		mike_instance.position.x = -218
		mike_instance.position.y = -6
		thomas_instance.position.x = -169
		thomas_instance.position.y = -6
		add_child(mike_instance)
		add_child(thomas_instance)
	elif selected_scenario == "s2_c2":
		var jerome_scene = preload("res://Scénarios/Scénario_bureau/Actor_office/Case 2/Jerome/jerome.tscn")
		var sophie_scene = preload("res://Scénarios/Scénario_bureau/Actor_office/Case 2/Sophie/sophie.tscn")
		var jerome_instance = jerome_scene.instantiate()
		var sophie_instance = sophie_scene.instantiate()
		jerome_instance.position.x = -218
		jerome_instance.position.y = -6
		sophie_instance.position.x = -169
		sophie_instance.position.y = -6
		add_child(jerome_instance)
		add_child(sophie_instance)
