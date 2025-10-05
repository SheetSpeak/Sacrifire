extends Area2D

@onready var player=get_parent()
@onready var me = $CollisionPolygon2D

func _process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction >0:
		scale.x=1
	elif direction<0:
		scale.x=-1
