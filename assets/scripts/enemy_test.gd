extends CharacterBody2D

const gravity = 1000

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	enemy_gravity(delta)
	move_and_slide()

func enemy_gravity(delta : float):
	velocity.y += gravity * delta


func _on_hurtbox_area_entered(area: Area2D) -> void:
	print("hurtbox area entered")
