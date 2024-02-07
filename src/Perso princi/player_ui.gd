extends Control

#Variable pour les Ui du personnage
@onready var hour_label = $PanelUI/Hour
@onready var portrait = $PanelPortrait/Portrait
@onready var ping = $PanelUI/Journal/Ping
@onready var quest_alert = $QuestAlert
@onready var fiche = $Fiche
@onready var notif = $QuestAlert/Notif
@onready var notes = $Notes
@onready var data = get_node("/root/Data")
@onready var notes_fiche = $Notes_fiche
@onready var moyenne = $Moyenne
@onready var notes_button = $Notes_fiche/notes_button
@onready var ping_notes = $Notes_fiche/Ping_notes
@onready var global = get_node("/root/VarPrinci")
@onready var destination_z = $Destination
@onready var notif_des = $Destination/Notif

var fiche_open = false
var notes_open = false
var isTalking

#Emmission de tous les signals
func _ready():
	moyenne.text = "Moyenne actuel : " + str(data.moyenne) + "/20"
	global.isItTalking.connect(_on_talking)
	global.new_entry.connect(_on_new_entry)
	global.new_fiche.connect(_on_new_fiche)
	global.new_notes.connect(_on_new_notes)
	data.end_scenar.connect(show_notes_button)
	portrait.play()
	
func _input(event):
	if event.is_action_pressed("ui_tab") && data.has_talked_supervisor == true && data.scenario_end == false:
		toggle_fiche()
	if event.is_action_pressed("ui_²") && data.scenario_end == true && global.count != 0:
		toggle_notes()
#voir notes
func toggle_notes():
	if notes_open:
		close_notes()
	else:
		open_notes()
# surlignement fiche
func toggle_fiche():
	if fiche_open:
		close_fiche()
	else:
		open_journal()
# Ouvrir note
func open_notes():
	ping_notes.hide()
	notes.show()
	notes_open = true
# Fermer notes
func close_notes():
	ping_notes.hide()
	notes.hide()
	notes_open = false
	
func open_journal():
	ping.hide()
	fiche.show()
	fiche_open = true

func close_fiche():
	ping.hide()  
	fiche.hide()
	fiche_open = false
	
func _process(_delta):
	var time = Time.get_time_dict_from_system()
	var formatted_time = ("%02d:%02d" % [time.hour, time.minute])
	hour_label.text = formatted_time
	
func _on_journal_pressed():
	if data.has_talked_supervisor == true && data.scenario_end == false:
		toggle_fiche()

func _on_talking(talking):
	isTalking = talking

func _on_new_entry():
	notif.text = "[center]NOUVELLE ENTREE FICHE"
	quest_alert.show()
	ping.show()
	await get_tree().create_timer(2).timeout
	quest_alert.hide()

func _on_new_notes():
	moyenne.text = "Moyenne actuel : " + str(data.moyenne) + "/20"
	notif.text = "[center]NOUVELLE ENTREE NOTES"
	quest_alert.show()
	await get_tree().create_timer(2).timeout
	quest_alert.hide()

func _on_new_fiche():
	notif.text = "[center]NOUVELLE FICHE RECUE"
	quest_alert.show()
	ping_notes.show()
	await get_tree().create_timer(2).timeout
	quest_alert.hide()

func show_destination(destination):
	if destination == "stade":
		notif_des.text = "[center]ALLEZ AU STADE"
	elif destination == "bureau":
		notif_des.text = "[center]ALLEZ AU BUREAU"
	elif destination == "boxe":
		notif_des.text = "[center]ALLEZ A LA SALLE"
	destination_z.show()

	

func hide_destination():
	destination_z.hide()
	
func show_notes_button():
	notes_fiche.show()
	notes_button.show()

func _on_notes_button_pressed():
	if data.scenario_end == true && global.count != 0:
		toggle_notes()
