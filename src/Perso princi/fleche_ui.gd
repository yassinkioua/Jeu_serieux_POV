extends TextureRect
@onready var pos_joueur = $"../pos_joueur"
@onready var data = get_node("/root/Data")
@onready var player_ui = $".."
var count = 0
var objective = Vector2(-95, 164) #vise le stade
var rotation_speed = PI*2;
func _physics_process(delta):
	verif_visibilite()
	# avoir le vector par rapport à la position
	var v = objective - pos_joueur.global_position
	# avoir angle du vecteur
	var angle = v.angle() + PI / 1.5
	var r = rotation
	#avoir la position autorisé dans la scene
	var angle_delta = rotation_speed * delta
	# avoir la rotation complète
	angle = lerp_angle(r, angle, 1.0)
	# limiter la rotation 
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	# mettre la rotation par rapport à l'angle
	rotation = angle

# fonction s'occupant à rendre visible ou non la fleche et où elle vise
func verif_visibilite():
	var scene_instance = get_tree().get_current_scene()
	player_ui.show_destination("stade")
	if data.scenario_start_stade == true:
		player_ui.hide_destination()
		visible = false
	elif data.scenario_end_stade == true:
		objective = Vector2(507, -116)
		player_ui.show_destination("bureau")
		visible = true
	if data.scenario_start_bureau == true:
		player_ui.hide_destination()
		visible = false
	elif data.scenario_end_bureau == true:
		player_ui.show_destination("boxe")
		objective = Vector2(-650, -100)
		visible = true
	if scene_instance.name != "manage_map":
		player_ui.hide_destination()
		visible = false
