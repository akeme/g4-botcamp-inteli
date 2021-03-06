extends Node
#warnings-disable

enum QuestionType { TEXT, IMAGE, VIDEO, AUDIO }

export(Resource) var bd_quiz
export(Color) var color_right
export(Color) var color_wrong

var buttons := []
var index := 0
var quiz_shuffle := []
var correct := 0
var timer := 15

onready var question_texts := $question_info/txt_question
onready var question_image := $question_info/image_holder/question_Image
onready var question_video := $question_info/image_holder/question_video
onready var question_audio := $question_info/image_holder/question_audio

func _ready() -> void:
	for _button in $question_holder.get_children():
		buttons.append(_button)
	
	quiz_shuffle = randomize_array(bd_quiz.bd)

	load_quiz()		

		
func load_quiz() -> void:
	if index >= quiz_shuffle.size():
		game_over()
		return
	
	question_texts.text = str(quiz_shuffle[index].question_info)
	
	var options = randomize_array(bd_quiz.bd[index].options)	
	for i in buttons.size():
		buttons[i].text = str(options[i])
		buttons[i].connect("pressed", self, "buttons_answer", [buttons[i]])
		
	match bd_quiz.bd[index].type:
		QuestionType.TEXT:
			$question_info/image_holder.hide()
			
		QuestionType.IMAGE:
			$question_info/image_holder.show()
			question_image.texture = bd_quiz.bd[index].question_image
			
		QuestionType.VIDEO:
			$question_info/image_holder.show()
			question_video.stream = bd_quiz.bd[index].question_video
			question_video.play()
			
		QuestionType.AUDIO:
			$question_info/image_holder.show()
			question_image.texture = load("res://sprites/sound.png")
			question_audio.stream = bd_quiz.bd[index].question_audio
			question_audio.play()
		
		
func buttons_answer(button) -> void:
	if bd_quiz.bd[index].correct == button.text:
		button.modulate = color_right
		correct += 1
		$audio_correct.play()
	else:
		button.modulate = color_wrong
		$audio_incorrect.play()
		
	_next_question()
		
		
func _next_question() -> void:
	question_audio.stop()
	question_video.stop()
	timer = 15
	
	yield(get_tree().create_timer(1), "timeout")
	for bt in buttons:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "buttons_answer")
		
	question_audio.stream = null
	question_video.stream = null
	index += 1
	load_quiz()


func randomize_array(array: Array) -> Array:
	randomize()
	var array_temp := array
	array_temp.shuffle()
	var aux = array_temp.slice(0,3)
	return aux
	#return array_temp

func game_over() -> void:
	$game_over.show()
	$game_over/txt_result.text = str(correct, "/", quiz_shuffle.size())
	$timer.stop()
	$txt_timer.hide()		


func _on_button_restart_pressed():
	get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	$txt_timer.text = str(timer)
	timer -= 1

	if timer < 0:
		_next_question()


func _on_button_retornar_pressed():
		get_tree().change_scene("res://scenes/Inicial.tscn")


func _on_Button_encerramento_pressed():
	get_tree().change_scene("res://scenes/Encerramento.tscn")
