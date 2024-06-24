extends Control

var mobs_singleton := Mobs

func _ready():
	mobs_singleton.number_mobs_updated.connect(_on_mobs_updated)

func _on_mobs_updated():
	print('Mobs Updated!')
	%Number_Enemies.text = str(mobs_singleton.get_number_mobs())
