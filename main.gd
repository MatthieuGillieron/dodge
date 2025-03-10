extends Node

@export var ennemies_scene: PackedScene
var score

func _ready() -> void:
	pass
	#new_game()

func game_over() -> void:
	$scoreTimer.stop()
	$ennemiesTimer.stop()
	$HUD.show_game_over()
	
	
func new_game():
	score = 0
	$player._start($startPos.position)
	$startTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("is comming !")


func _on_start_timer_timeout() -> void:
	$ennemiesTimer.start()
	$scoreTimer.start()
	


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)



func _on_ennemies_timer_timeout() -> void:
	var ennemies = ennemies_scene.instantiate()
	
	var ennemies_spwan_loc = get_node("ennemiesPath/ennemiesSpawnLoc")
	ennemies_spwan_loc.progress_ratio = randf()
	
	var direction = ennemies_spwan_loc.rotation + PI / 2;
	
	ennemies.position = ennemies_spwan_loc.position;
	
	var velocity = Vector2(randf_range(300.0, 550.0), 0.0)
	ennemies.linear_velocity = velocity.rotated(direction)
	
	add_child(ennemies)
