extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

func _ready():
	$AnimatedSprite2D.play("chasing")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_postition)
	velocity = direction * 75.0
	move_and_slide()
