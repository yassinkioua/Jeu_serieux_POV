extends Area2D

@export var dialogue_ressource: DialogueResource
@export var dialogue_start: String = "start"
@onready var pnjui = $"../pnjui"
@onready var data = get_node("/root/Data")
var comportement = "gentil"
var friends = 0
func _process(_delta):
	if data.has_talked_supervisor == true:
		pnjui.show()
	else:
		pnjui.hide()

func action() -> void:
	if data.has_talked_supervisor == true:
		data.set_who_talking(comportement)
		data.set_friends_talking(friends)
		DialogueManager.show_example_dialogue_balloon(dialogue_ressource, dialogue_start)
		pnjui.hide()
		queue_free()

