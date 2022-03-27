extends AnimatedSprite




var direction


func _ready():
	if direction > 0:
		flip_h = true
	


func _physics_process(delta):
	global_translate(Vector2(direction, 0))


func hit():
	play("hit")
	$"/root/HitSfx".play()
	set_physics_process(false)
	yield(self, "animation_finished")
	GameManager.score += 1
	GameManager.emit_signal("score_changed")
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
