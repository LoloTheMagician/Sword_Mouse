class_name Health_Component
extends Node


signal life_updated


@export var life : int = 10:
	set = set_life,
	get = get_life


func set_life(new_life : int) -> int:
	life = new_life
	var element_alive = is_alive()
	life_updated.emit()
	if not element_alive:
		dead()
	return get_life()


func get_life() -> int:
	print(life)
	return life


func add_life(amount_add : int):
	var actual_life = get_life()
	actual_life += amount_add
	set_life(actual_life)
	

func substract_life(amount_substract : int):
	var actual_life = get_life()
	actual_life -= amount_substract
	set_life(actual_life)


func is_alive() -> bool:
	const NO_ALIVE = 0
	return get_life() > NO_ALIVE


func dead():
	owner.queue_free()
