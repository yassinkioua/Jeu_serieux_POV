extends Node2D
@onready var princi = get_node("/root/VarPrinci")
@onready var data = get_node("/root/Data")
# Cas de scénario
var scenario_stade = [
	"s1_c1", "s1_c2"
]
#Fonction qui génère le cas de scénario aléatoirement
func _ready():
	princi.count = 0	
	princi.isFighting = false
	princi.isFightingA = false
	princi.isFightingB = false
	data.scenario_end = false
	if data.scenario_end_stade == false:
		randomize() 
		var index = randi() % scenario_stade.size()
		var selected_scenario = scenario_stade[index]
		generate_child(selected_scenario)
		data.update_chosen_case(selected_scenario)
	else:
		queue_free()

# Fonction pour générer les perso de scénario en fonction de la valeur que nous renvoie le ramdom dans ma fonction précédante
func generate_child(selected_scenario):
	if selected_scenario == "s1_c1":
		var moussa_scene = preload("res://Scénarios/Scénario_stade/Actor/Case 1/Moussa/Moussa.tscn")
		var jack_scene = preload("res://Scénarios/Scénario_stade/Actor/Case 1/Jack/Jack.tscn")
		var moussa_instance = moussa_scene.instantiate()
		var jack_instance = jack_scene.instantiate()
		moussa_instance.position.x = -137
		moussa_instance.position.y = 341
		jack_instance.position.x = -141
		jack_instance.position.y = 312
		add_child(moussa_instance)
		add_child(jack_instance)
	elif selected_scenario == "s1_c2":
		var yair_scene = preload("res://Scénarios/Scénario_stade/Actor/Case 2/Yair/yair.tscn")
		var paul_scene = preload("res://Scénarios/Scénario_stade/Actor/Case 2/Paul/paul.tscn")
		var yair_instance = yair_scene.instantiate()
		var paul_instance = paul_scene.instantiate()
		paul_instance.position.x = -137
		paul_instance.position.y = 341
		yair_instance.position.x = -141
		yair_instance.position.y = 312
		add_child(paul_instance)
		add_child(yair_instance)
