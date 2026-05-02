extends CharacterBody2D

var deathEffect = preload("res://assets/scenes/areas/enemy_death_effect.tscn")
#var bullet = preload("res://assets/scenes/areas/boss_bullet.tscn")
@export var bullet_scene: PackedScene

@onready var ac = $audio_controller
@onready var muzzle : Marker2D = $BossMuzzle
var health : int = 30
const gravity = 1000

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
		ac.play_ranged_hit()
		
	elif area.has_method("get_damage_amount"):
		var node = area as Node
		health -= node.damage*3
		print("Dummy health:", health)
		ac.play_melee_hit()
		
	if health <= 0:
		var enemy_death_effect_instance = deathEffect.instantiate() as Node2D
		enemy_death_effect_instance.global_position = global_position
		get_parent().add_child(enemy_death_effect_instance)
		queue_free()
		
	## attacking mechanics
func boss_shooting(_delta):
	
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = muzzle.global_position
	print(get_tree().get_nodes_in_group("player"))
		
	var player = get_tree().get_first_node_in_group("player")
	print(muzzle.global_position)
	if player:
		var target_pos = player.global_position + Vector2(0,-20)
		var dir = (target_pos - bullet.global_position).normalized()
		bullet.direction = dir
			
		print("boss shot")


func _on_timer_timeout() -> void:
	boss_shooting(0)
