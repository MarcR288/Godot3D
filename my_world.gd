extends Node3D
@onready var canvas_layer: CanvasLayer = $CanvasLayer

var time_left = 30 # seconds
@onready var timer: Timer = $Timer
@onready var label_3d: Label3D = $Timer/Label3D

var isTimeLeft := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	isTimeLeft = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	time_left -= 1
	if time_left <= 0:
		timer.stop()
		isTimeLeft = false;
		get_tree().reload_current_scene()
	else:
		label_3d.text = str(time_left)




func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D and isTimeLeft:
		win_game()

func win_game():
	print("You win")
	canvas_layer.visible = true
	time_left = 60
