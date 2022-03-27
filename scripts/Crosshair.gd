extends Sprite


var body_on_sight


func _physics_process(delta):
	global_position = get_global_mouse_position()


func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		fire()


func fire():
	show()
	$Timer.start()
	GameManager.bullets -= 1
	if GameManager.bullets <= 0:
		GameManager.emit_signal("game_over")
	
	GameManager.emit_signal("bullet_spent")
	$Gunshot.play()
	if body_on_sight != null:
		body_on_sight.hit()


func _on_Area2D_area_entered(area):
	body_on_sight = area.get_parent()


func _on_Area2D_area_exited(area):
	body_on_sight = null


func _on_Timer_timeout():
	$Timer.stop()
	hide()
