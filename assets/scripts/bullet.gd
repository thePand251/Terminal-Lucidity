extends AnimatedSprite2D

var bulletImpact = preload("res://assets/scenes/areas/bullet_impact.tscn")
@onready var bullet : AnimatedSprite2D = $"."

var speed : int = 400
var direction : int
var damage : int = 1



func _physics_process(delta):
	move_local_x(direction * speed * delta)
	if direction == -1:
		bullet.flip_h = true

func _on_timer_timeout():
	queue_free()


func _on_hitbox_area_entered(_area: Area2D) -> void:
	print("bullet area entered")
	bullet_impact()
	
func _on_hitbox_body_entered(_body: Node2D) -> void:
	print("bullet body entered")
	bullet_impact()

func bullet_impact():
	var bullet_impact_effect_instance = bulletImpact.instantiate() as Node2D
	bullet_impact_effect_instance.global_position = global_position
	get_parent().add_child(bullet_impact_effect_instance)
	queue_free()

func get_damage_amount() -> int:
	return damage
