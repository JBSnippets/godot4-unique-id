@tool
@icon("jbs_unique_id.png")

## A custom node that generates a unique ID to be concatenated to, or replace the parent node's name.
##
## This custom node can be added as a child of an existing node. The parent node will then have its name either concatenated with the ID or replaced by the ID.
class_name UniqueId
extends Node

enum _length_type {
	Short = 0,
	Medium = 1,
	Long = 2
}

## The length of the unique Id to generate
@export var length: _length_type = _length_type.Short

## The string separator between the original node name and unique ID. [br]
## [color=orange]NOTE[/color]: not used when [member replace_original] is true.
@export var separator: String = ""

## Select to enable the plugin
@export var enabled: bool = true

## Select to replace the original name
@export var replace_original: bool = false

## Select to free this node after use
@export var free_after_use: bool = true

func _ready():
	if Engine.is_editor_hint(): return
	
	if not enabled:
		if free_after_use:
			queue_free()
		return
		
	var uid: String = ""
	match length:
		_length_type.Short:
			uid = _generate_short_uid()
		_length_type.Medium:
			uid = _generate_medium_uid()
		_length_type.Long:
			uid = _generate_long_uid()
	
	var parent = get_parent()
	if replace_original:
		parent.name = uid
	else:
		parent.name = "%s%s%s" % [parent.name, separator, uid]
	
	if free_after_use: queue_free()
	
func _generate_short_uid() -> String:
	var uuid = ""
	for i in range(4):
		uuid += "%02X" % (randi() % 256)
	return uuid
	
func _generate_medium_uid() -> String:
	var uuid = PackedByteArray()
	for i in range(8):
		uuid.append(randi() % 256)  # Fill with random bytes

	# Format the UUID string
	return "%02X%02X%02X%02X%02X%02X4%01X%01X" % [
		uuid[0], uuid[1], uuid[2], uuid[3],  # First 8 hex characters
		uuid[4], uuid[5],  # Next 4 hex characters
		uuid[6],  # First 1 hex character after the version '4'
		(uuid[7] & 0x0F)  # Last 1 hex character masked to 4 bits
	]

func _generate_long_uid() -> String:
	var uuid = PackedByteArray()
	for i in range(16):
		uuid.append(randi() % 256)  # Fill with random bytes

	# Ensure it is a version 4 UUID
	uuid[6] = (uuid[6] & 0x0F) | 0x40  # Set the version to 4 (0100xxxx)
	uuid[8] = (uuid[8] & 0x3F) | 0x80  # Set the variant to DCE 1.1 (10xxxxxx)

	# Format the UUID string
	return "%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X" % [
		uuid[0], uuid[1], uuid[2], uuid[3],  # 8 hex characters
		uuid[4], uuid[5],  # 4 hex characters
		uuid[6], uuid[7],  # 4 hex characters (including version 4)
		uuid[8], uuid[9],  # 4 hex characters (including variant)
		uuid[10], uuid[11], uuid[12], uuid[13], uuid[14], uuid[15]  # 12 hex characters
	]
