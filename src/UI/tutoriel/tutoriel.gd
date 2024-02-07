extends CanvasLayer

signal exit_options()
var index_panel = 0
@onready var objectif = $Background/Objectif
@onready var mapping = $Background/Mapping
@onready var last = $Background/last
@onready var skip = $Background/skip
@onready var indications = $Background/Indications
@onready var options_game = $".."
@onready var tutoriel = $"."

var options = false
func _process(_delta):
	if index_panel == 0:
		last.hide()
		skip.show()
	elif index_panel ==2:
		skip.hide()
		last.show()
	else: 
		skip.show()
		last.show()

# Quand le bouton exit est appuyé
func _on_exit_pressed():
	if options:
		options_game.show()
		tutoriel.hide()
	else:
		exit_options.emit()

# Quand le bouton skip est appuyé
func _on_skip_pressed():
	index_panel+=1
	if index_panel == 1:
		mapping.show()
		objectif.hide()
		indications.hide()
	elif index_panel == 2:
		indications.show()
		mapping.hide()

# Quand le bouton last est appuyé
func _on_last_pressed():
	index_panel-=1
	if index_panel == 0:
		mapping.hide()
		objectif.show()
	elif index_panel == 1:
		indications.hide()
		mapping.show()

# Quand le bouton échap est appuyé
func _on_options_game_options_game_sig():
	options = true
