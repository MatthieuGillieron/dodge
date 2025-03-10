extends RigidBody2D

func _ready() -> void:
	var ennemies_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(ennemies_types[randi() % ennemies_types.size()])
	
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
