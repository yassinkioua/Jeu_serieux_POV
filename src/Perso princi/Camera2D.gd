extends Camera2D

const ZOOM_SPEED = 0.1

func _process(_delta):
	# Gestion du zoom avec la molette de la souris
	if Input.is_action_just_pressed("zoom_in") && zoom.x > 0.3 :
		zoom_in()
	elif Input.is_action_just_pressed("zoom_out") && zoom.x < 1 :
		zoom_out()
	if zoom.x - 1.00 < 0.1 && 1.00 - zoom.x < 0.1:
		zoom.x = 1
		zoom.y = 1
		$"../PlayerUI".visible = true
	else :
		$"../PlayerUI".visible = false
# Fonction pour effectuer un zoom avant
func zoom_in():
	set_zoom(get_zoom() * (1.0 - ZOOM_SPEED))

# Fonction pour effectuer un zoom arrière
func zoom_out():
	set_zoom(get_zoom() * (1.0 + ZOOM_SPEED))
