extends Spatial

export var mapSize = Vector2(64, 64)
export var mapSeed: String

class tileType:
	var meshName: String
	var BlocksSight: bool
	var BlocksMovement: bool

class mapTile:
	enum {UNEXPLORED, NOTVISIBLE, VISIBLE}
	var type: String
	var visibility
	
# Called when the node enters the scene tree for the first time.
func _ready():
	seed(mapSeed.hash())
