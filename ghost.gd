extends CharacterBody2D


const SPEED = 300.0
@onready var char = $"../Player"
var isInRange=false

func _physics_process(delta: float) -> void:
	if not isInRange:
		position.x=move_toward(position.x,char.position.x,0.5)
		position.y=move_toward(position.y,char.position.y,0.5)
	else:
		position.x=move_toward(position.x,char.position.x,1)
		position.y=move_toward(position.y,char.position.y,1)
		
	

	move_and_slide()
