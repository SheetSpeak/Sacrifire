extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var charSet = get_tree().get_nodes_in_group("Player")
const SPEED = 300.0
var isAngiable=true
var setAngyToggle=false
var isDead=false
var gotHurt=false
var player=null
var isTransforming=false

func _ready() -> void:
	for i in charSet:
		if i.name=="Player":
			player = i
			break

func die():
	if setAngyToggle and not isTransforming:
		gotHurt=true
		setAngyToggle=false
		animation.animation="No_angy"
		await get_tree().create_timer(0.6).timeout
		gotHurt=false
		
	elif not isTransforming:
		animation.animation="Die"
		isDead=true
		await get_tree().create_timer(1).timeout
		queue_free()

func _physics_process(delta: float) -> void:
	if isDead or gotHurt:
		pass
	else:
		if setAngyToggle:
			if isAngiable:
				isTransforming=true
				animation.animation="Angy"
				await get_tree().create_timer(0.6).timeout
				isTransforming=false
				isAngiable=false
			animation.animation="AngyIdle"
			position.x=move_toward(position.x,player.position.x,1.5)
			position.y=move_toward(position.y,player.position.y,1.5)
		else:
			animation.animation="default"
			position.x=move_toward(position.x,player.position.x,0.5)
			position.y=move_toward(position.y,player.position.y,0.5)
		
func isAngy():
	if isAngiable:
		setAngyToggle=true
	

	move_and_slide()
