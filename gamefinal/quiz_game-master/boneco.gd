extends KinematicBody2D


var velocidade = Vector2.ZERO

func _physics_process(delta):
	var vetor_entrada = Vector2.ZERO
	vetor_entrada.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	vetor_entrada.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	velocidade = vetor_entrada
	move_and_slide(velocidade*100)
	if (vetor_entrada == Vector2.ZERO):
		$AnimationPlayer.play("parado")
	else:
		if(vetor_entrada.x>0):
			$AnimationPlayer.play("Andando_direita")
		else:
			$AnimationPlayer.play("Andando_esquerda")



