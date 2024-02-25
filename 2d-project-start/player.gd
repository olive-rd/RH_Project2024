extends CharacterBody2D

signal game_over

const speed = 100
var health = 100.0
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
	
	const damage_rate = 5.0
	var overlapping_mobs = %HitBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		%ProgressBar.value = health
	if health <= 0.0:
		game_over.emit()
	
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
