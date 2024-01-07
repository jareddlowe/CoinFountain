extends Area2D

var bounced_once = false
var velocity = Vector2(0, 0)
var coin_sprite_velocity = Vector2(0, 0)

func _ready():
	# Start the first upward movement
	coin_sprite_velocity.y -= randf_range(4, 5)


func _process(delta):
	# Slow the whole coin over time
	velocity = velocity.lerp(Vector2.ZERO, 0.06)

	# Move the whole coin 
	position += velocity
	
	# Apply gravity to the coin sprite's body
	coin_sprite_velocity.y += 0.2

	# Move the coin sprite's body
	$CoinSprite.position += coin_sprite_velocity

	# Triggers when coin sprite goes below the shadow/origin point
	if $CoinSprite.global_position.y > global_position.y: 
		$CoinSprite.global_position.y = global_position.y # Prevents coin from actually going below shadow
		coin_sprite_velocity.y = 0 # Prevents coin from actually going below shadow
		if not bounced_once: # Triggers bounce 
			coin_sprite_velocity.y -= randf_range(2, 3)
			bounced_once = true
	
