extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var parent = null
var zoomSpeed = null
var minZoomDistance = null
var maxZoomDistance = null

# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	zoomSpeed = parent.zoomSpeed
	minZoomDistance = parent.minZoomDistance
	maxZoomDistance = parent.maxZoomDistance


func _process(delta):
	look_at(parent.translation, Vector3.UP)
	if Input.is_action_just_released("zoom_out") && translation.z <= maxZoomDistance:
		translation.z += zoomSpeed * delta
	if Input.is_action_just_released("zoom_in") && translation.z >= minZoomDistance:
		translation.z -= zoomSpeed * delta
