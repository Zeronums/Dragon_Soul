extends Area2D

const proj_speed=200
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

var savedmg = "res://savedmg.txt"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var speed_x = 1
	var speed_y = 0
	var motion = Vector2(speed_x, speed_y) * proj_speed
	set_position(get_position() + motion * delta)


func _on_body_entered(body):
	
	print(body.get_index())
	if body.get_index()==5:
		if body.checkSpeed()==0:
			queue_free()
			body.ceva()
	else:
		queue_free()

