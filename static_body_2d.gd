extends StaticBody2D

@onready var char = $"../CharacterBody2D"

var playerPos=char.global_position

func _physics_process(delta:float) -> void:
	position.x=move_toward(position.x,playerPos,400)
	move_and_slide()
