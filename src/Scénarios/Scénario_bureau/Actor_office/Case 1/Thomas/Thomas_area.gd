extends Area2D

@export var dialogue_ressource: DialogueResource
@export var dialogue_start: String = "start"
@onready var pnjui = $"../pnjui"
@onready var princi = get_node("/root/VarPrinci")

func _process(_delta):
	if princi.count == 6:
		pnjui.show()
		
func action() -> void:
	if princi.count == 6 && princi.isFightingB == false:
		DialogueManager.show_example_dialogue_balloon(dialogue_ressource, dialogue_start)
		pnjui.hide()
		queue_free()
