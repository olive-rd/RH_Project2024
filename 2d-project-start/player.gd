extends CharacterBody2D


func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 150
	move_and_slide()
	$AnimatedSprite2D.play("walk")
func _ready():
	$AnimatedSprite2D.play("idle")
