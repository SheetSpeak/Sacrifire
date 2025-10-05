extends Node2D

@onready var ghost :PackedScene= preload("res://ghost.tscn")

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	var newghost=ghost.instantiate();
	newghost.position=Vector2(100,100)
	add_child(newghost)
	
	


func _on_timer_timeout() -> void:
	var newghost=ghost.instantiate();
	newghost.position=Vector2(0,0)
	add_child(newghost)
