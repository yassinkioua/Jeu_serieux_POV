extends Control 

# Variable pour les fiches
@onready var exit = $exit
@onready var fiche = $"."
@onready var a_name = $Fiche_a/Name
@onready var a_true = $Fiche_a/TrueComs/TrueText
@onready var a_subj = $Fiche_a/SubjComs/SubjText
@onready var a_sprite = $Fiche_a/PortraitPanel/a_sprite
@onready var b_name = $Fiche_b/Name
@onready var b_true = $Fiche_b/TrueComs/TrueText
@onready var b_subj = $Fiche_b/SubjComs/SubjText
@onready var b_sprite = $Fiche_b/PortraitPanel/b_sprite

var a_subj_final = []
var b_subj_final = []
var last_index = 0
var portrait_textures = {
	"Moussa": preload("res://Assets/Modern UI/Portrait/Moussa.png"),
	"Jack": preload("res://Assets/Modern UI/Portrait/Jack.png"),
	"Alex": preload("res://Assets/Modern UI/Portrait/Alex.png"),
	"Cyril": preload("res://Assets/Modern UI/Portrait/Cyril.png"),
	"Jérôme": preload("res://Assets/Modern UI/Portrait/Jérôme.png"),
	"Mike": preload("res://Assets/Modern UI/Portrait/Mike.png"),
	"Ngannou": preload("res://Assets/Modern UI/Portrait/Ngannou.png"),
	"Paul": preload("res://Assets/Modern UI/Portrait/Paul.png"),
	"Thomas": preload("res://Assets/Modern UI/Portrait/Thomas.png"),
	"Tyson": preload("res://Assets/Modern UI/Portrait/Tyson.png"),
	"Yair": preload("res://Assets/Modern UI/Portrait/Yair.png"),
	"Sophie": preload("res://Assets/Modern UI/Portrait/Sophie.png"),
}

@onready var data = get_node("/root/Data")

func _ready():
	init_fiche()
	data.index.connect(set_update_index)
	data.last.connect(set_update_sentence)
	data.end_scenar.connect(set_final_fiche)

# Bouton exit
func _on_exit_pressed():
	fiche.hide()

# Initialisation des fiches
func init_fiche():
	reset_fiche()
	a_true.text = ""
	b_true.text = ""
	set_characters_name()
	set_default_sentence()
	set_sprite_portrait()

# mise en place des noms 
func set_characters_name():
	a_name.text = "> " + data.get_character_name_1() + "[color=yellow]" + " (A)" + "[/color]"
	b_name.text = "> " + data.get_character_name_2() + "[color=yellow]" + " (B)" + "[/color]"

# Mise en place des phrases par défauts
func set_default_sentence():
	var arraydefault1 = data.get_default_sentence_1()
	for element in arraydefault1:
		a_true.text += element + "\n"
		
	var arraydefault2 = data.get_default_sentence_2()
	for element in arraydefault2:
		b_true.text += element + "\n"

# Mise à jour des index
func set_update_index(index):
	last_index = index

# Mise à jour des phrases dans la fiche
func set_update_sentence(sentence):
	if sentence == "> Tableau rempli : ":
		return
	if last_index == 0 || last_index == 2:
		a_subj.text = (a_subj.text + sentence).strip_edges() + "\n"
	else:
		b_subj.text = (b_subj.text + sentence).strip_edges() + "\n"

#Mise en place des portrait sur la fiche
func set_sprite_portrait():
	for x_name in portrait_textures.keys():
		if x_name == data.get_character_name_1():
			a_sprite.texture = portrait_textures[x_name]
		elif x_name == data.get_character_name_2():
			b_sprite.texture = portrait_textures[x_name]

# reset de la fiche
func reset_fiche():
	a_subj.text = ""
	b_subj.text = ""
	data.last_index = 0
	data.last_sentence = ""

# Mise en place de la fiche finale
func set_final_fiche():
	var sentence = data.get_initial_sentence()
	reset_fiche()
	for array_element in sentence:
		for element in array_element:
			if data.last_index == 0 || data.last_index == 1:
				element = "[color=yellow]" + element + "[/color]"
			data.set_last_sentence(element)
		data.last_index +=1
	
