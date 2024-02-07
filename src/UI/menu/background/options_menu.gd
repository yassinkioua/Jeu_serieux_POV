extends Control

signal exit_options()

@onready var window: Window = get_tree().get_root()
@onready var music = %Music

func _ready():
	AudioServer.set_bus_volume_db(1, 40)
	music.value = 40

# Fonction quannd le bouton exit est appuyé
func _on_exit_pressed():
	exit_options.emit()

# Fonction quand on change la musique
func _on_music_value_changed(value):
	volume(1, value)

#Fonction pour set le volume
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index,value)

#Fonction pour set le v_sync
func _on_v_sync_check_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

#Fonction pour set le full screen
func _on_fullscreen_check_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

#Fonction pour set le l'écran en borderless
func _on_borderless_check_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
