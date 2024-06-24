extends Control

@onready var health_component : Health_Component = %Health_Component

func _ready():
	$Label.text = str(health_component.get_life())
	


func _on_health_component_life_updated():
	$Label.text = str(health_component.get_life())
