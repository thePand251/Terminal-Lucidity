extends CharacterBody2D

var movementSpeed = 500

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("moveUp") == true:
		velocity.y -= movementSpeed * delta;
	if Input.is_action_pressed("moveDown") == true:
		velocity.y += movementSpeed * delta;
	if Input.is_action_pressed("moveLeft") == true:
		velocity.x -= movementSpeed * delta;
	if Input.is_action_pressed("moveRight") == true:
		velocity.x += movementSpeed * delta;
	velocity.y *= 0.9
	velocity.x *= 0.9
	move_and_slide()
