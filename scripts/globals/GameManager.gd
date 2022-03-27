extends Node


signal bullet_spent
signal game_over
signal score_changed


var SAVE_PATH = "user://ChickenShoot/save"

var bullets: int = 30
var score: int

var data: Data
