extends Node2D


var enemy = preload("res://actors/Enemy.tscn")

var rng = RandomNumberGenerator.new()


onready var spawners_arr = $Respawners.get_children()


func _ready():
	OS.center_window()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	GameManager.bullets = 30
	GameManager.score = 0


func spawn_enemy():
	rng.randomize()
	
	var rand = rng.randi_range(0, spawners_arr.size() - 1)
	
	var new_enemy = enemy.instance()
	new_enemy.direction = spawners_arr[rand].direction
	spawners_arr[rand].add_child(new_enemy)


func _on_Timer_timeout():
	spawn_enemy()




