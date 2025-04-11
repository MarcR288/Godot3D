extends Timer

var timr_left = 30

@onready var timer: Timer = $"."
@onready var label_3d: Label3D = $Label3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.star()

func _on_Timer_timeout():
	timr_left -= 1
	if timr_left <= 0:
		timer.stop()
		label_3d.text = "Time's up!"
	else:
		label_3d.text = str(time_left)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
