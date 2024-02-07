extends Node

# Lecture de fichier et insertion
var data_file_path = "res://Data/data.json"
var defaultArrayPerso_1 = []
var defaultArrayPerso_2 = []
var defaultTruePerso_1 = []
var defaultTruePerso_2 = []
var defaultFalsePerso_1 = []
var defaultFalsePerso_2 = []
var script_reader = []
var copyTruePerso_1
var copyTruePerso_2
var copyFalsePerso_1
var copyFalsePerso_2
var selectedScenarioCase
var characterkeys
var perso_1
var perso_2

# Vérification/Manipulation de donneés
var isSupervisor
var has_talked_supervisor
var has_talked_supervisor_bureau
var has_talked_supervisor_muscu

# Modification/Update pour les fiches
var last_sentence = ""
signal last(last_sentence)
var last_index = 0
signal index(last_index)
var last_comportement
var last_friends
var end = false
signal end_scenar
signal create_fiche

# Vérifie le début de chaque scénario
var scenario_start_stade = false
var scenario_start_bureau = false
var scenario_start_boxe = false
# Vérifie la fin de chaque scénario
var scenario_end_stade = false
var scenario_end_bureau = false
var scenario_end_boxe = false
var scenario_end = false
var count_scenario = 0
# Préparation de "notes"
var note_stade = 0
var note_bureau = 0
var note_boxe
var notes = 0
var moyenne = 0
var compteur_moyenne = 0
signal note_scenar(notes)
@onready var princi = get_node("/root/VarPrinci")

# Fonction pour lancer la lecture du fichier data.json
func start_reading():
	var itemData = load_json_file(data_file_path)
	set_character_names(itemData)
	viderTableaux()
	process_sentence_data(itemData, perso_1,defaultArrayPerso_1, "default_sentence")
	process_sentence_data(itemData, perso_2,defaultArrayPerso_2, "default_sentence")
	process_sentence_data(itemData, perso_1,defaultTruePerso_1, "true_sentence")
	process_sentence_data(itemData, perso_2,defaultTruePerso_2, "true_sentence")
	process_sentence_data(itemData, perso_1,defaultFalsePerso_1, "false_sentence")
	process_sentence_data(itemData, perso_2,defaultFalsePerso_2, "false_sentence")
	process_sentence_data(itemData, perso_1, script_reader, "script")
	copyTruePerso_1 = defaultTruePerso_1.duplicate()
	copyTruePerso_2 = defaultTruePerso_2.duplicate()
	copyFalsePerso_1 = defaultFalsePerso_1.duplicate()
	copyFalsePerso_2 = defaultFalsePerso_2.duplicate()
		

#Fonction qui sert a vider les tableau 
func viderTableaux():
	defaultArrayPerso_1.clear()
	defaultArrayPerso_2.clear()
	defaultTruePerso_1.clear()
	defaultTruePerso_2.clear()
	defaultFalsePerso_1.clear()
	defaultFalsePerso_2.clear()

#Fonction qui sert à charger le fichier data.json
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
	else:
		print("File doesn't exist")

#Fonction qui sert à mettre le scénario 
func update_chosen_case(selected_scenario):
	selectedScenarioCase = selected_scenario
	start_reading()
	
#Fonction qui sert à choisir le cas de scénario
func get_selected_scenario_case():
	return selectedScenarioCase
	

func set_character_names(itemData):
	var getcharacterkeys = itemData[selectedScenarioCase]
	characterkeys = getcharacterkeys.keys()
	perso_1 = characterkeys[0]
	perso_2 = characterkeys[1]

# Transfoer un ligne json en chaine de caractère
func process_sentence_data(itemData, character, dataArray, type):
	var sentence = itemData[selectedScenarioCase][character][type]
	var elements = sentence.split(", ")  
	for element in elements:
		dataArray.append(element)
		
func get_character_name_1()-> String:
	return perso_1

func get_character_name_2()-> String:
	return perso_2

func get_default_sentence_1() -> Array:
	return defaultArrayPerso_1

func get_default_sentence_2() -> Array:
	return defaultArrayPerso_2

func get_initial_sentence():
	var sentence = [
		defaultTruePerso_1,
		defaultTruePerso_2,
		defaultFalsePerso_1,
		defaultFalsePerso_2
	]
	return sentence

# Fonction très importante pour random les phrases des pnj
func get_random_sentence(current_index):
	var random_sentence = [
		copyTruePerso_1,
		copyTruePerso_2,
		copyFalsePerso_1,
		copyFalsePerso_2,
	]
	
	if random_sentence[current_index].size() == 0:
		if current_index == 0:
			current_index = 1
		elif current_index == 1:
			current_index = 0
		elif current_index == 2:
			current_index = 3
		elif current_index == 3:
			current_index = 2
	var selected_tableau = random_sentence[current_index]
	var random_element_index = randi_range(0, selected_tableau.size() - 1)
	var selected_element = selected_tableau[random_element_index]
	selected_tableau.remove_at(random_element_index)
	last_index = current_index
	return selected_element

func set_last_sentence(sentence):
	last_sentence = sentence
	emit_signal("index", last_index)
	emit_signal("last", last_sentence)

func get_script_reader():
	return script_reader
func set_who_talking(comportement):
	last_comportement = comportement
	
func set_friends_talking(friends):
	last_friends = friends
	
func set_end_dialog(end_dialog):
	end = end_dialog

func set_is_supervisor(supervisor):
	isSupervisor = supervisor

func set_has_talked_supervisor(has_talked):
	has_talked_supervisor = has_talked

func set_complete_fiche_end(nom):
	if nom == "stade":
		scenario_start_stade = false
		scenario_end_stade = true
	elif nom == "bureau":
		scenario_start_bureau = false
		scenario_end_bureau = true
	elif nom == "boxe":
		scenario_start_boxe = false
		scenario_end_boxe = true
	scenario_end = true
	emit_signal("end_scenar")


func set_notes(scenar_note):
	if count_scenario == 0:
		note_stade = scenar_note
		count_scenario+=1
	elif count_scenario == 1:
		note_bureau = scenar_note
		count_scenario+=1
	elif count_scenario == 2:
		note_boxe = scenar_note
		count_scenario+=1
	notes = scenar_note
	compteur_moyenne += 1
	moyenne = (moyenne * (compteur_moyenne - 1) + notes) / compteur_moyenne
	emit_signal("note_scenar", notes)
	
func get_note_stade():
	return note_stade
	
func get_note_bureau():
	return note_bureau
	
func get_note_boxe():
	return note_boxe

func get_glob_moyenne():
	return moyenne
	

