extends StaticBody2D

@onready var data = get_node("/root/Data")
# Met la colision de la barrière à false à la fin du scénario 
func _ready():
	$CollisionShape2D.disabled = true
	data.end_scenar.connect(_on_connect_end_scenar)
# Met la colision de la barrière à true pendant le scénario
func _process(_delta):
	if data.scenario_start_boxe :
		$CollisionShape2D.disabled = false

# Supprime la node à la fin de la fonction ready
func _on_connect_end_scenar():
	$CollisionShape2D.queue_free() 
	
