extends CharacterBody2D


var SPEED = 300.0
const WALKSPEED=300.0
const DASHSPEED = 900.0


func _physics_process(delta: float) -> void:
	var directiony := Input.get_axis("up", "down")
	var direction := Input.get_axis("left", "right")
	if directiony and not direction:
		velocity.y = directiony * SPEED
		velocity.x= move_toward(velocity.x,0,SPEED)
	elif direction and not directiony:
		velocity.x = direction * SPEED
		velocity.y= move_toward(velocity.y,0,SPEED)
	elif direction and directiony:
		velocity.y=directiony*SPEED/1.41
		velocity.x=direction*SPEED/1.41
	else:
		velocity.x= move_toward(velocity.x,0,SPEED)
		velocity.y= move_toward(velocity.y,0,SPEED)
	
	if Input.is_action_pressed("dash"):
		SPEED=DASHSPEED
	else:
		SPEED=WALKSPEED
		
	move_and_slide()
