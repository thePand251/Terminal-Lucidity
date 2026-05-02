extends Area2D

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			#AudioController.music_player.stop()
			#AudioController.music_player.stream = boss_music
			#AudioController.music_player.play()
			pass
