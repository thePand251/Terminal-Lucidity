extends CharacterBody2D

var deathEffect = preload("res://assets/scenes/areas/enemy_death_effect.tscn")
var health : int = 3

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
	if area.get_parent().has_method("get_damage_amount"):
		var node = area.get_parent() as Node
		health -= node.damage
		print("Dummy health:", health)
	elif area.has_method("get_damage_amount"):
		var node = area as Node
		health -= node.damage
		print("Dummy health:", health)
		
	if health <= 0:
		var enemy_death_effect_instance = deathEffect.instantiate() as Node2D
		enemy_death_effect_instance.global_position = global_position
		get_parent().add_child(enemy_death_effect_instance)
		queue_free()
