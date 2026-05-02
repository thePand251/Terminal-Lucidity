extends Node2D

@export var mute : bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mute"):
		if mute == true:
			mute = false
		elif mute == false:
			mute = true

func _on_ready() -> void:
	if not mute:
		play_music()

func play_music():
	if not mute:
		$MusicPlayer.play()
		
func play_melee_attack():
	if not mute:
		$Melee_attack.play()

func play_melee_hit():
	if not mute:
		$Melee_hit.play()
		
func play_ranged_hit():
	if not mute:
		$Ranged_hit.play()

func play_ranged_attack():
	if not mute:
		$Ranged_attack.play()

func play_footsteps():
	if not mute:
		#$Footsteps.play()
		pass
