extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btniniciar_pressed():
	get_tree().change_scene("res://scenes/Inicial.tscn")


func _on_btnproximo_pressed():
	get_tree().change_scene("res://scenes/intro2.tscn")



