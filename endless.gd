extends Node2D

@onready var ghost :PackedScene= preload("res://ghost.tscn")

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	
	


func _on_timer_timeout() -> void:
	var newghost=ghost.instantiate();
	newghost.position=Vector2(randi_range(-100,100),randi_range(-100,100))
	add_child(newghost)
