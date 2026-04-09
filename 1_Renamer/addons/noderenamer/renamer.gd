@tool
extends EditorPlugin

var dock
var window
const RENAME_WINDOW = preload("res://addons/noderenamer/rename_window.tscn")

func _enter_tree():
	dock = EditorDock.new()
	dock.title = "My Dock"
	dock.default_slot = EditorDock.DOCK_SLOT_LEFT_UL
	window = RENAME_WINDOW.instantiate()
	window.undo_redo = get_undo_redo()
	dock.add_child(window)
	add_dock(dock)
	
	# change condition to make the dialogue appear after choosing the option on right click
	#dialogue = Window.new()
	#dialogue.add_child(dialogue_scene)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_dock(dock)
	dock.queue_free()
