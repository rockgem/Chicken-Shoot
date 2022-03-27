extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	GameManager.bullets = 30
	
	
	var dir = Directory.new()
	if !dir.dir_exists(GameManager.SAVE_PATH):
		dir.make_dir_recursive(GameManager.SAVE_PATH)
		
		var file = File.new()
		if !file.file_exists(GameManager.SAVE_PATH + "/data.tres"):
			var dict = {"highscore": 0}
			
			var res = Data.new()
			res.highscore = dict.get("highscore")
			
			ResourceSaver.save(GameManager.SAVE_PATH + "/data.tres", res)
	else:
		var loaded_res = ResourceLoader.load(GameManager.SAVE_PATH + "/data.tres")
		GameManager.data = loaded_res


func _on_Play_pressed():
	get_tree().change_scene("res://scenes/World.tscn")
