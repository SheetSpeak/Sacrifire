extends CharacterBody2D


@onready var hudTextSet= get_tree().get_nodes_in_group("hudText")

var SPEED = 300.0
const WALKSPEED=300.0
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

var hudText=null

var hasFire=false
var hasVision=false

@onready var animation = $AnimatedSprite2D

func _ready() -> void:
	for i in hudTextSet:
		if i.name=="Label":
			hudText=i
			break
func lvl():
	Global.level+=1
func die():
	get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	if Global.level==0:
		hudText.text="Move Forward..."
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
	elif Global.level==1:
		hudText.text="Present me a sacrifice... use my flame..."
		Fire1.visible=true
		Fire1Col.disabled=false
		Fire2.visible=false
		Fire2Col.disabled=true
		Fire3.visible=false
		Fire3Col.disabled=true
		Fire4.visible=false
		Fire4Col.disabled=true
	elif Global.level==2:
		hudText.text="Now bring me as many sacrifices as you can..."
		Fire1.visible=true
		Fire1Col.disabled=false
		Fire2.visible=true
		Fire2Col.disabled=false
		Fire3.visible=true
		Fire3Col.disabled=false
		Fire4.visible=true
		Fire4Col.disabled=false
			
			
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
