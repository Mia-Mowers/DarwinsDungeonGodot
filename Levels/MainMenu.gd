extends Control

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		QuitGame()

func StartGame():
	get_tree().change_scene("res://Levels/Dungeon.tscn")

func QuitGame():
	get_tree().quit()


func _on_Start_pressed():
	StartGame()


func _on_Options_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	QuitGame()
