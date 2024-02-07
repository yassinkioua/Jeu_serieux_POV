extends Control


signal main_options()
signal tutoriel()
@onready var buttons = %buttons

func _ready() -> void :
	focus_button()
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Intro/manage_intro.tscn")
	hide()
		
func _on_tutoriel_pressed():
	tutoriel.emit()
	hide()


func _on_options_pressed():
	main_options.emit()
	hide()


func _on_exit_pressed():
	get_tree().quit()

func _on_visibility_changed() -> void:
	if visible:
		focus_button()
		
func focus_button() -> void:
	if buttons:
		var button: Button = buttons.get_child(0)
		if button is Button:
			button.grab_focus()



