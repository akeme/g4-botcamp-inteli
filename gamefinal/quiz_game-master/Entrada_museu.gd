extends Area2D



func _on_Entrada_museu_body_entered(body):
	get_tree().change_scene("res://scenes/Confirmacao_museu.tscn")
