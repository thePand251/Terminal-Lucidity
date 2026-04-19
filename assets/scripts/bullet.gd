extends AnimatedSprite2D

var bulletImpact = preload("res://assets/scenes/areas/bullet_impact.tscn")

var speed : int = 100
var direction : int
func _physics_process(delta):
	move_local_x(direction * speed * delta)

func _on_timer_timeout():
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("bullet area entered")
	
func _on_hitbox_body_entered(body: Node2D) -> void:
	print("bullet body entered")
