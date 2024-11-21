extends StaticBody2D
#https://www.youtube.com/watch?v=yT22SXYpoYM

const TEXTURE = preload("res://Assets/Placeholder_Textures/Light/texture_09.png")
const OBSTACLE_MAT = preload("res://World/Obstacles/obstacle_mat.tres")
@export var isGenerating := true
@export var MIN_POINTS := 3
@export var MAX_POINTS := 6
@export var DIMENSION_SIZE := 200.0
@export var TEXTURE_OFFSET := 500
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var navigation_obstacle_2d: NavigationObstacle2D = $NavigationObstacle2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if isGenerating:
		var polygon_node = Polygon2D.new()
		var points_number = randi_range(MIN_POINTS, MAX_POINTS)
		var vector_points_arr : Array[Vector2]
		for point in points_number:
			var vector_point = Vector2(randf_range(-DIMENSION_SIZE,DIMENSION_SIZE),randf_range(-DIMENSION_SIZE,DIMENSION_SIZE))
			vector_points_arr.append(vector_point)
		vector_points_arr.sort_custom(sort_clockwise)
		var convex = ConvexPolygonShape2D.new()
		convex.set_point_cloud(PackedVector2Array(vector_points_arr))
		polygon_node.polygon = convex.points
		polygon_node.texture = TEXTURE
		polygon_node.texture_offset = Vector2(randi_range(-TEXTURE_OFFSET,TEXTURE_OFFSET),randi_range(-TEXTURE_OFFSET,TEXTURE_OFFSET))
		polygon_node.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
		polygon_node.material = OBSTACLE_MAT
		add_child(polygon_node)
		collision_polygon_2d.polygon = polygon_node.polygon
		navigation_obstacle_2d.vertices = polygon_node.polygon

func sort_clockwise(a, b):
	if isGenerating:
		return a.angle() < b.angle()
