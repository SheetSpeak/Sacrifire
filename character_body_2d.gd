extends CharacterBody2D


var SPEED = 200.0
const WALKSPEED=200.0
const RUNSPEED = 500.0

@onready var animation = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var directiony := Input.get_axis("up", "down")
	var direction := Input.get_axis("left", "right")
	if direction<0:
		animation.flip_h=true
	elif direction>0:
		animation.flip_h=false
	if directiony and not direction:
		velocity.y = directiony * SPEED
		velocity.x= move_toward(velocity.x,0,SPEED)
		animation.animation="walk"
	elif direction and not directiony:
		animation.animation="walk"
		velocity.x = direction * SPEED
		velocity.y= move_toward(velocity.y,0,SPEED)
	elif direction and directiony:
		animation.animation="walk"
		velocity.y=directiony*SPEED/1.41
		velocity.x=direction*SPEED/1.41
	else:
		animation.animation="default"
		velocity.x= move_toward(velocity.x,0,SPEED)
		velocity.y= move_toward(velocity.y,0,SPEED)
	
	if Input.is_action_pressed("run"):
		SPEED=RUNSPEED
	else:
		SPEED=WALKSPEED
		
	move_and_slide()
