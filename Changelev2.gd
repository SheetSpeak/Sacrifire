extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		body.lvl()
		get_tree().change_scene_to_file("res://level2.tscn")
