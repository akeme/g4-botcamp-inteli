extends Node2D






func _process(delta):
	if Input.is_action_just_pressed("press_f") == true:
		get_tree().change_scene("res://scenes/Confirmacao_finalizacao.tscn")












