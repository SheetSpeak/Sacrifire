extends CharacterBody2D


@onready var animation = $AnimatedSprite2D
@onready var char = $"../Player"
const SPEED = 300.0
var isAngiable=true
var setAngyToggle=false
var isDead=false
var gotHurt=false
func die():
	if setAngyToggle:
		gotHurt=true
		setAngyToggle=false
		animation.animation="No_angy"
		await get_tree().create_timer(0.6).timeout
		gotHurt=false
		
	else:
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
				animation.animation="Angy"
				await get_tree().create_timer(0.6).timeout
				isAngiable=false
			animation.animation="AngyIdle"
			position.x=move_toward(position.x,char.position.x,1.5)
			position.y=move_toward(position.y,char.position.y,1.5)
		else:
			animation.animation="default"
			position.x=move_toward(position.x,char.position.x,0.5)
			position.y=move_toward(position.y,char.position.y,0.5)
		
func isAngy():
	if isAngiable:
		setAngyToggle=true
	

	move_and_slide()
