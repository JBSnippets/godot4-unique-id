extends Node

var save_path = "user://persistent.ids"
var persistent_ids: Dictionary = {}

func _ready() -> void:
	if Engine.is_editor_hint(): return
	_load_from_file()

func _load_from_file() -> void:
	var file = FileAccess.open(save_path, FileAccess.READ)
	if !file: return
	persistent_ids = file.get_var()
	file.close()

func add_id(instance_id: int, unique_id: String) -> void:
	persistent_ids[instance_id] = unique_id

func remove_id(instance_id: int) -> void:
	persistent_ids.erase(instance_id)

func load_id(instance_id: int) -> String:
	if !persistent_ids.is_empty() and persistent_ids.has(instance_id):
		return persistent_ids.get(instance_id)
	return ""

func save_ids() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(persistent_ids)
	file.close()
