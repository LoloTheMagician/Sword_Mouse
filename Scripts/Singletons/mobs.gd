extends Node

signal number_mobs_updated(number_mobs)

var number_mobs : int = 0:
	set = set_number_mobs,
	get = get_number_mobs
	
func set_number_mobs(new_number_mobs : int) -> int:
	number_mobs = new_number_mobs
	number_mobs_updated.emit()
	return get_number_mobs()
	
func get_number_mobs() -> int:
	return number_mobs


var add_mobs = func(amount_mobs : int): set_number_mobs(get_number_mobs() + amount_mobs)
	

