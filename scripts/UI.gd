extends Control




func _ready():
	$Label.text = "Bullets: %s" % str(GameManager.bullets)
	
	GameManager.connect("bullet_spent", self, "on_bullet_spent")
	GameManager.connect("game_over", self, "on_game_over")
	GameManager.connect("score_changed", self, "on_score_changed")


func on_bullet_spent():
	$Label.text = "Bullets: %s" % str(GameManager.bullets)


func on_game_over():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$ColorRect/Label.text = "Game Over\nScore: %s" % str(GameManager.score)
	
	if GameManager.score > GameManager.data.highscore:
		GameManager.data.highscore = GameManager.score
		ResourceSaver.save(GameManager.SAVE_PATH + "/data.tres", GameManager.data)
	
	$ColorRect/Highscore.text = "Highscore: %s" % str(GameManager.data.highscore)
	$ColorRect.show()


func on_score_changed():
	$Score.text = str(GameManager.score)


func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")
