extends Area2D

@onready var parent = $".."

@onready var setVis=get_tree().get_nodes_in_group("vis")



func _on_body_entered(body: Node2D) -> void:
	if body.name in "Fire2Fire3Fire4" or body.name in setVis:
		parent.die()
		get_tree().create_timer(1).timeout
	elif body.name =="Player":
		body.die()
