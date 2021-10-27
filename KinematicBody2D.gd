extends KinematicBody2D

var velocidade = Vector2.ZERO

func _physics_process(delta):
	var vetor_entrada = Vector2.ZERO
	vetor_entrada.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	vetor_entrada.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	velocidade = vetor_entrada
	move_and_slide(velocidade*100)
	if (vetor_entrada == Vector2.ZERO):
		$AnimationPlayer.play("Idle")
	else:
		if(vetor_entrada.x>0):
			$AnimationPlayer.play("Andando_direita")
		else:
			$AnimationPlayer.play("Andando_esquerda")
## Called when the node enters the scene tree for the first time.
#func _process(delta):
#	if Input.is_action_pressed("ui_down"):
#		position.y +=1
#	if Input.is_action_pressed("ui_up"):
#		position.y -=1
#	if Input.is_action_pressed("ui_left"):
#		position.x -=1
#	if Input.is_action_pressed("ui_right"):
#		position.x +=1
#
