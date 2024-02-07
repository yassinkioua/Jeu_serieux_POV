extends CanvasLayer

@onready var princi = get_node("/root/VarPrinci")
@onready var options_game = $"."
@onready var tutoriel = $tutoriel
signal options_game_sig
var count = 0

# Appeler quand le bouton tutuoriel est appuyé
func _on_tutoriel_pressed():
	options_game.hide()
	emit_signal("options_game_sig")
	tutoriel.show()

# Appeler quand le bouton return est appuyé
func _on_return_pressed():
	Engine.time_scale = 1
	options_game.hide()
	princi.count_militaire = 0

# Appeler quand le bouton leave est appuyé
func _on_leave_pressed():
	get_tree().quit()
