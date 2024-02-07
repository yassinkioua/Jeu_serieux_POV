extends Node2D

signal isItTalking(isTalking)
signal new_entry
signal new_fiche
signal new_notes
signal bad_ending
var isHitting = false
var isFighting = false
var isFightingA = false
var isFightingB = false
var count = 0

# Emettre les signal
func update_talking(talking):
	emit_signal("isItTalking", talking)
	
func do_entry():
	emit_signal("new_entry")

func do_fiche():
	emit_signal("new_fiche")

func do_notes():
	emit_signal("new_notes")

func set_update_count_talk(count_c):
	count = count_c

# Début combat
func start_fighting(tag):
	if tag == "A":
		isFightingA = true
	elif tag == "B":
		isFightingB = true
	isFighting = true
# Mauvaise fin
func bad_end():
	emit_signal("bad_ending")
