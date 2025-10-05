extends Node2D

@onready var ghost :PackedScene= preload("res://ghost.tscn")

func _ready() -> void:
	var newghost=ghost.instantiate();
	newghost.position=Vector2(500,10)
	add_child(newghost)
