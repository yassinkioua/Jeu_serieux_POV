extends CanvasLayer

# Variable des élément dans BlackScreen
@onready var exit = $BlackScreen/EXIT
@onready var stade_label = $BlackScreen/StadeLabel
@onready var bureau_label = $BlackScreen/BureauLabel
@onready var boxe_label = $BlackScreen/BoxeLabel
@onready var end_text = $BlackScreen/MarginContainerEnd/EndText
@onready var end_game = $"."
@onready var moyenne_label = $BlackScreen/MoyenneLabel
@onready var data = get_node("/root/Data")
@onready var princi = get_node("/root/VarPrinci")
var notes_stade 
var notes_bureau
var notes_boxe

# Fonction pour définir les fonctions à utiliser
func define():
	princi.update_talking(true)
	if princi.isFighting:
		fill_bad_ending_text()
	else:
		set_end_text()
		fill_text()

# Géneration du texte sur la BlackScreen
func fill_text():
	notes_stade = data.get_note_stade()
	notes_bureau = data.get_note_bureau()
	notes_boxe = data.get_note_boxe()
	stade_label.text = stade_label.text + "[color=yellow] "+ str(notes_stade) + "[/color]" 
	bureau_label.text = bureau_label.text + "[color=yellow] "+ str(notes_bureau) + "[/color]" 
	boxe_label.text = boxe_label.text + "[color=yellow] "+ str(notes_boxe) + "[/color]" 

# Génération du gros texte de fin
func set_end_text():
	var moyenne = data.get_glob_moyenne()
	moyenne_label.text = moyenne_label.text + "[color=yellow] "+ str(moyenne) + "[/color]" 
	if moyenne >= 10:
		end_text.text = "[center][color=green]Vous avez été admis ![/color]"
	else:
		end_text.text = "[center][color=red]Vous avez été recalé ...[/color]"

# Bouton exit
func _on_exit_pressed():
	get_tree().quit()

# Mauvaise Fin si bagarre
func fill_bad_ending_text():
	end_text.text = "[center][color=red]Aucune raison de se battre, recalé ! [/color]"
	bureau_label.text = "Réflexion = [color=yellow]0[/color]"
	boxe_label.text = "Sang chaud = [color=yellow]1[/color]"
	moyenne_label.text = "Moyenne finale = [color=yellow]0[/color]"
	stade_label.text = "Note finale = [color=yellow]0[/color]"
