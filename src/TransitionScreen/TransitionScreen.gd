extends CanvasLayer

signal transitionned
	
# Définir la transition
func transition():
	$AnimationPlayer.play("fade_to_black")
	await get_tree().create_timer(3).timeout

# Dire quand l'animation est fini
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitionned")

# Fin de transition
func endtransition():
	$AnimationPlayer.play("fade_to_normal")
