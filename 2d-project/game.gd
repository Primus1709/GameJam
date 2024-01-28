extends Node2D


func spawn_mob():
	var new_mob=  preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position =%PathFollow2D.global_position
	add_child(new_mob)


func spawn_trees():
	var new_trees=  preload("res://tree_scene.tscn").instantiate()
	new_trees.global_position = %PathFollow2D.global_position
	add_child(new_trees)



func _on_timer_timeout():
	spawn_mob()
	spawn_trees()
	



func _on_player_health_depleted():
	%Gameover.visible = true
	get_tree().paused = true
