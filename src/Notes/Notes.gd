extends Control

@onready var notes = $Notes
@onready var notes_panel = $Notes/Notes_panel
@onready var notes_count = $Notes/Notes_panel/Notes_count

@onready var phrases = $Phrases
@onready var phrases_panel = $Phrases/Phrases_panel

@onready var script_scenar = $Script
@onready var script_panel = $Script/Script_panel

@onready var data = get_node("/root/Data")
@onready var faux_texte = $Phrases/Phrases_panel/Faux_panel/Faux_texte
@onready var vrai_texte = $Phrases/Phrases_panel/Vrai_panel/Vrai_texte

@onready var fiche_name = $Notes/Notes_panel/Fiche_name
@onready var script_text = $Script/Script_panel/Script_Text

func _ready():
	data.end_scenar.connect(set_final_fiche)
	data.note_scenar.connect(set_final_notes)
	set_fiche_name()
	set_script_notes()

# Fonction pour dire quand on appuie sur le boutons les différents onglet de la fiches note
func _input(event):
	if event.is_action_pressed("ui_&"):
		show_notes()
	if event.is_action_pressed("ui_é"):
		show_phrases()
	if event.is_action_pressed("ui_quote"):
		show_script()

# Signal quand on appuie sur la touche
func _on_notes_pressed():
	show_notes()
	
func _on_phrases_pressed():
	show_phrases()
	
func _on_script_pressed():
	show_script()

#Fonction pour définir la note final
func set_final_fiche():
	data.last_index = 0
	data.last_sentence = ""
	var sentence = data.get_initial_sentence()
	for array_element in sentence:
		for element in array_element:
			set_update_sentence(element)
		data.last_index +=1

# Fonction pour mettre les notes final
func set_final_notes(notes_scenar):
	notes_count.text = "[color=yellow]" + str(notes_scenar) + "/20[/color]"

# Fonction pour mettre à jour les nom dans la fiche
func set_fiche_name():
	var name_scenar = data.get_selected_scenario_case()
	if name_scenar == "s1_c1" || name_scenar == "s1_c2":
		fiche_name.text = "[color=yellow]stade[/color]"
	elif name_scenar == "s2_c1" || name_scenar == "s2_c2":
		fiche_name.text = "[color=yellow]bureau[/color]"
	elif name_scenar == "s3_c1" || name_scenar == "s3_c2":
		fiche_name.text = "[color=yellow]boxe[/color]"

# Fonction pour mettre à jour les phrases
func set_update_sentence(sentence):
	if sentence == "> Tableau rempli : ":
		return
	if data.last_index == 0 || data.last_index == 1:
		vrai_texte.text = (vrai_texte.text + sentence).strip_edges() + "\n"
	else:
		faux_texte.text = (faux_texte.text + sentence).strip_edges() + "\n"

# Fonction pour voir les différents onglets
func show_notes():
	notes.z_index = 0
	notes_panel.show()
	phrases.z_index = -1
	phrases_panel.hide()
	script_scenar.z_index = -1
	script_panel.hide()

func show_phrases():
	notes.z_index = -1
	notes_panel.hide()
	phrases.z_index = 0
	phrases_panel.show()
	script_scenar.z_index = -1
	script_panel.hide()

func show_script():
	notes.z_index = -1
	notes_panel.hide()
	phrases.z_index = -1
	phrases_panel.hide()
	script_scenar.z_index = 0
	script_panel.show()

# Fonction pour set les scripts
func set_script_notes():
	script_text.text =""
	var array = data.get_script_reader()
	for element in array:
		script_text.text = element
	
