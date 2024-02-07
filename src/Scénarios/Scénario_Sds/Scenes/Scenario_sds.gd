extends Node2D

@onready var princi = get_node("/root/VarPrinci")
@onready var data = get_node("/root/Data")
# Cas de scénario
var scenario_sds = [
	"s3_c1","s3_c2"
]
#Fonction qui génère le cas de scénario aléatoirement
func _ready():
	if data.scenario_end_boxe == false:
		princi.isFighting = false
		princi.isFightingA = false
		princi.isFightingB = false
		data.scenario_end = false
		princi.count = 0
		randomize() 
		var index = randi() % scenario_sds.size()
		var selected_scenario = scenario_sds[index]
		generate_child(selected_scenario)
		data.update_chosen_case(selected_scenario)
	else:
		queue_free()
	
# Fonction pour générer les perso de scénario en fonction de la valeur que nous renvoie le ramdom dans ma fonction précédante
func generate_child(selected_scenario):
	if selected_scenario == "s3_c1":
		var ngannou_scene = preload("res://Scénarios/Scénario_Sds/Actor_sds/Case 1/Ngannou/ngannou.tscn")
		var tyson_scene = preload("res://Scénarios/Scénario_Sds/Actor_sds/Case 1/Tyson/tyson.tscn")
		var ngannou_instance = ngannou_scene.instantiate()
		var tyson_instance = tyson_scene.instantiate()
		ngannou_instance.position.x = -141
		ngannou_instance.position.y = 8
		tyson_instance.position.x = -173
		tyson_instance.position.y = 8
		add_child(ngannou_instance)
		add_child(tyson_instance)
	elif selected_scenario == "s3_c2":
		var cyril_scene = preload("res://Scénarios/Scénario_Sds/Actor_sds/Case 2/Cyril/cyril.tscn")
		var alex_scene = preload("res://Scénarios/Scénario_Sds/Actor_sds/Case 2/Alex/alex.tscn")
		var cyril_instance = cyril_scene.instantiate()
		var alex_instance = alex_scene.instantiate()
		cyril_instance.position.x = -141
		cyril_instance.position.y = 8
		alex_instance.position.x = -173
		alex_instance.position.y = 8
		add_child(cyril_instance)
		add_child(alex_instance)
