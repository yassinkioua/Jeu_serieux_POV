extends Area2D

@export var dialogue_ressource: DialogueResource
@export var dialogue_start: String = "start"
@onready var pnjui = $"../pnjui"
@onready var princi = get_node("/root/VarPrinci")
@onready var data = get_node("/root/Data")

func _process(_delta):
	if princi.count == 3 ||  princi.count == 5 ||  princi.count == 6:
		pnjui.hide()
	elif princi.count == 2:
		pnjui.show()

# Fonction quand on intéragie avec le superviseur
func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_ressource, dialogue_start)
	if data.scenario_end_boxe != true:
		data.scenario_start_boxe = true
	else:
		data.scenario_start_boxe = false
