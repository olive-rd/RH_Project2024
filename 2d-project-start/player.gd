extends CharacterBody2D

const speed = 100
var current_dir = "right"
func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		play_anim(1)
		current_dir = "right"
		velocity.x = speed
		velocity.y = 0
		
	elif Input.is_action_pressed("ui_left"):
		play_anim(1)
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
		
	elif Input.is_action_pressed("ui_up"):
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
		
	elif Input.is_action_pressed("ui_down"):
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
		
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
	
func _ready():
	$AnimatedSprite2D.play("idle")

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D

	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk")
		else:
			anim.play("idle")
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk")
		else:
			anim.play("idle")
