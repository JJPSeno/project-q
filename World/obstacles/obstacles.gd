extends StaticBody2D

@export var MIN_POINTS := 3
@export var MAX_POINTS := 6
@export var DIMENSION_SIZE := 40.0
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var polygon_node = Polygon2D.new()
	var points_number = randi_range(MIN_POINTS, MAX_POINTS)
	var vector_points_arr : Array[Vector2]
	for point in points_number:
		var vector_point = Vector2(randf_range(-DIMENSION_SIZE,DIMENSION_SIZE),randf_range(-DIMENSION_SIZE,DIMENSION_SIZE))
		vector_points_arr.append(vector_point)
	vector_points_arr.sort_custom(sort_clockwise)
	polygon_node.set_polygon(PackedVector2Array(vector_points_arr))
	add_child(polygon_node)
	print_debug(polygon_node.polygon)
	collision_polygon_2d.polygon = polygon_node.polygon


func sort_clockwise(a, b):
	return a.angle() < b.angle()
