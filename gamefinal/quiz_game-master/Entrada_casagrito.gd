extends Area2D



func _on_Entrada_casagrito_body_entered(body):
	get_tree().change_scene("res://scenes/Confirmacao_casagrito.tscn")
