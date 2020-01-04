extends Area2D

onready var o_sprite := preload("res://assets/o.png")
onready var x_sprite := preload("res://assets/x.png")

var checked := false

func _onl_mouse_entered() -> void:
	if not checked:
		$placeholder.visible = true

func _on_mouse_exited() -> void:
	if not checked:
		$placeholder.visible = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not checked and event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			$x_o.texture = x_sprite
		else:
			$x_o.texture = o_sprite
			
		$placeholder.visible = false
		checked = true
		set_size()

func set_size() -> void:
	var target_size := Vector2(50, 50)
	var image_size = $x_o.get_texture().get_size()
	var scale = target_size / image_size
	$x_o.set_scale(scale)