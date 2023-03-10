extends StaticBody2D

onready var wall = $Line2D
onready var background = $Background

# Called when the node enters the scene tree for the first time.
func _ready():
	var points = wall.get_points()
	# len() - 1 because last point will be connected
	# to point n - 1 already
	for x in range(len(points)-1):
		print(x, points[x])
		var segment = CollisionShape2D.new()
		segment.shape = SegmentShape2D.new()
		segment.shape.a = points[x]
		segment.shape.b = points[x+1]
		add_child(segment)
		
	# Fill the background
	background.polygon = points

