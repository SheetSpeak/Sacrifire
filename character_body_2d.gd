extends CharacterBody2D


var SPEED = 200.0
const WALKSPEED=200.0
const RUNSPEED = 500.0
var hasEmb= false

@onready var Fire1=$Fire
@onready var Fire2=$Fire2
@onready var Fire3=$Fire3
@onready var Fire4=$Fire4
@onready var Fire1Col=$Fire/CollisionShape2D
@onready var Fire2Col=$Fire2/CollisionShape2D
@onready var Fire3Col=$Fire3/CollisionShape2D
@onready var Fire4Col=$Fire4/CollisionShape2D
@onready var Vision=$Vision

var hasFire=false
var hasVision=false

@onready var animation = $AnimatedSprite2D

func die():
	get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	
	
	if hasVision:
		Vision.visible=true
	if hasFire:
		Fire1.visible=true
		Fire1Col.disabled=false
		Fire2.visible=true
		Fire2Col.disabled=false
		Fire3.visible=true
		Fire3Col.disabled=false
		Fire4.visible=true
		Fire4Col.disabled=false
	else:
		Fire1.visible=false
		Fire1Col.disabled=true
		Fire2.visible=false
		Fire2Col.disabled=true
		Fire3.visible=false
		Fire3Col.disabled=true
		Fire4.visible=false
		Fire4Col.disabled=true
		
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
		
	move_and_slide()
