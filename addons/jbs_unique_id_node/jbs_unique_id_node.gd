@tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("PersistentId", "res://addons/jbs_unique_id_node/jbs_persistent_id.gd")
	add_custom_type("UniqueId", "Node", preload("res://addons/jbs_unique_id_node/jbs_unique_id.gd"), preload("res://addons/jbs_unique_id_node/jbs_unique_id.png"))
	
func _exit_tree():
	remove_custom_type("UniqueId")
	remove_autoload_singleton("PersistentId")
