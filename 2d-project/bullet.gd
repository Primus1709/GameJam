extends Area2D

var travelled_distance =0 

func _physics_process(delta):
	
	const SPEED = 1000
	const RANGE = 1200;
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction*SPEED*delta
	
	travelled_distance += SPEED*delta
	
	if travelled_distance > RANGE:
		queue_redraw()


func _on_body_entered(body):
	print(body)
	if body.has_method("take_damage"):
		body.take_damage()
		
		const SMOKE_SCENE =preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke =SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
	queue_free()


