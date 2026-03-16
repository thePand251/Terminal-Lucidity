extends Node2D

@export var playerController : PlayerController
@export var animationPlayer : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if playerController.direction == 1:
		sprite.flip_h = false
	elif playerController.direction == -1:
		sprite.flip_h = true
		
	if abs(playerController.velocity.x) > 0:
		animationPlayer.play("walk")
	else:
		animationPlayer.play("idle")
	
	if playerController.velocity.y < 0:
		animationPlayer.play("jump")
	elif playerController.velocity.y > 0:
		animationPlayer.play("fall")
