extends CharacterBody2D

const MAX_SPEED = 100
const FRICTION = 1000
const ACCELERATION = 1000
@onready var end_game = $EndGame
signal isBeenHitting(isHitting)
var direction = Vector2.ZERO
var isTalking = false
var isHitting = false
@onready var actionable_finder: Area2D = $Direction/ActionnableFinder
@onready var animation_tree = $AnimationTree
@onready var interact = $Interact
@onready var data = get_node("/root/Data")
@onready var global = get_node("/root/VarPrinci")
@onready var deform_label = $DeformLabel
@onready var options_game = $OptionsGame

var count = 0
var count_fight = 0
func _ready():
	global.isItTalking.connect(_on_talking)

#Fonction pour les mouvements et touches du personnage

func _on_talking(talking):
	isTalking = talking

	
func _physics_process(delta):
	player_movement(delta)


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func player_movement(delta):
	direction.x = Input.get_action_strength("ui_droite") -Input.get_action_strength("ui_gauche")
	direction.y = Input.get_action_strength("ui_reculer") - Input.get_action_strength("ui_avancer")

	if (direction==Vector2.ZERO):
		apply_friction(FRICTION * delta)
	else :
		if $Camera2D.zoom.x != 1:
			reset_cam()
		if isTalking == false:
			apply_movement(ACCELERATION * direction * delta)
			direction = direction.normalized()
			move_and_slide()
			if Input.is_action_pressed("ui_shift"):
				apply_movement(ACCELERATION*50 * direction * delta)
				direction = direction.normalized()
				move_and_slide()

func apply_friction(fric):
	if velocity.length() > fric:
		velocity -= velocity.normalized() * fric
	else :
		velocity = Vector2.ZERO

func apply_movement(acc):
	velocity += acc
	velocity = velocity.limit_length(MAX_SPEED)

func _process(_delta):
	direction = Input.get_vector("ui_gauche","ui_droite","ui_avancer","ui_reculer")

	if Input.is_action_just_pressed("ui_echap") && global.count_militaire != 1:
		Engine.time_scale = 0
		options_game.show()
		global.count_militaire=1
	if direction != Vector2.ZERO and isTalking == false and not isHitting:
		set_runnig(true)
		update_blend_position()
	else:
		set_runnig(false)
	if global.isFighting:
		deform_label.visible = true
		interact.hide()
	if global.count == 3:
		interact.hide()
	if Input.is_action_pressed("ui_hit") && global.isFighting == true:
		set_hitting(true)
	if data.scenario_end_stade == true && data.scenario_end_bureau == true && data.scenario_end_boxe == true && count == 0:
		end_game.define()
		end_game.visible = true
		count+=1
	if global.isFighting && count_fight == 0:
		global.bad_ending.connect(_on_bad_ending)
		count_fight+=1
 
#Fonction pour les animations du personnage principale

func set_hitting(value = false):
	global.isHitting = true
	await get_tree().create_timer(0.4).timeout
	animation_tree["parameters/conditions/hit"] = value
	global.isHitting = false
 
func set_runnig(value):
	animation_tree["parameters/conditions/is_running"] = value
	animation_tree["parameters/conditions/idle"] = not value
 
func update_blend_position():
	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/run/blend_position"] = direction
	animation_tree["parameters/hit/blend_position"] = direction

func _on_actionnable_finder_area_entered(_area):
	interact.show()
		
func _on_actionnable_finder_area_exited(_area):
	interact.hide()

#Fonction pour reset la caméra
func reset_cam():
	if $Camera2D.zoom.x - 1.00 < 0.1 && $Camera2D.zoom.x - 1.00 > -0.1:
		$Camera2D.zoom.x = 1
		$Camera2D.zoom.y = 1
	elif $Camera2D.zoom.x - 1.00 >= -0.1:
		$Camera2D.zoom.x = $Camera2D.zoom.x - ($Camera2D.zoom.x /5)
		$Camera2D.zoom.y = $Camera2D.zoom.y - ($Camera2D.zoom.y /5)
	elif $Camera2D.zoom.x - 1.00 <= 0.1:
		$Camera2D.zoom.x = $Camera2D.zoom.x + ($Camera2D.zoom.x /5)
		$Camera2D.zoom.y = $Camera2D.zoom.y + ($Camera2D.zoom.y /5)

#Fonction pour activer la mauvaise fin (bagarre)
func _on_bad_ending():
	end_game.define()
	end_game.visible=true
