extends Node2D

#
#var opcao_v
#var scene_path_to_load
#var scene_path_right = "res://scenes//acertou.tscn"
#var scene_path_wrong = "res://scenes//errou.tscn"
#
#var resposta_correta = "lblopcao" + "A"
#
#
#func _ready():
#	var button = Button.new()
#	button.text = "Click me"
#	button.connect("pressed", self, "_button_pressed")
#	add_child(button)
#
#func _button_pressed():
#	print("Hello world!")

func _ready():
	pass
#	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
#	for button in $Menu/CenterRow/Buttons.get_children():
#		button.connect("pressed", self, "_on_Button_pressed", scene_path_wrong)





func _on_btnopcaoA_pressed():
	get_tree().change_scene("res://scenes/acertou.tscn")




func _on_btnopcaoB_pressed():
	get_tree().change_scene("res://scenes/errou.tscn")


func _on_btnopcaoC_pressed():
	get_tree().change_scene("res://scenes/errou.tscn")


func _on_btnopcaoD_pressed():
	get_tree().change_scene("res://scenes/errou.tscn")
