extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game_scene/CharacterBody2D")

func _ready():
	$AnimatedSprite2D.play("chasing")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 75.0
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		$AnimatedSprite2D.play("death")
		queue_free()
