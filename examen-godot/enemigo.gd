extends CharacterBody2D


const SPEED = -200.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		velocity.x = SPEED 
		
	if $RayCast2D.is_colliding():
		velocity.x = SPEED * 2
	else :
		velocity.x = SPEED

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print ("Has muerto")
		get_tree().quit()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()
