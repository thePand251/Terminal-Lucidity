extends Area2D

var speed : int = 400
var direction : int
var damage : int = 1

func _physics_process(delta):
	move_local_x(direction * speed * delta)

func _on_timer_timeout():
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("melee area entered")
	
	
func _on_hitbox_body_entered(body: Node2D) -> void:
	print("melee body entered")
	

func get_damage_amount() -> int:
	return damage
