extends Area2D

@onready var parent = $".."


func _on_body_entered(body: Node2D) -> void:
	if body.name in "Fire2Fire3Fire4":
		parent.die()
		get_tree().create_timer(1).timeout
	elif body.name =="Player":
		body.die()
