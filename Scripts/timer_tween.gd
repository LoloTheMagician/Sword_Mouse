extends Timer

func _ready():
	wait_time = random_wait_time()

func random_wait_time():
	return randf_range(1, 2)
