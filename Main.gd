extends Node2D


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			spawn_coins(25, get_global_mouse_position())


func spawn_coins(amount, pos):
	for i in amount:
		var new_coin = load("res://coin.tscn").instantiate()
		add_child(new_coin)
		new_coin.position = pos
		var direction = Vector2((randf_range(-1, 1)),(randf_range(-1, 1)))
		direction = direction.normalized()
		var power = randf_range(1, 5)
		new_coin.velocity = direction * power
