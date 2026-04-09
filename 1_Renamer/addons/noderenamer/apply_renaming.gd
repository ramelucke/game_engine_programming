@tool
extends Control

var undo_redo : EditorUndoRedoManager

func _on_apply_button_pressed():
	# Applies the name change to the selected nodes
	var selection = EditorInterface.get_selection()
	var position = %PrefixButton.button_pressed
	var renaming_string = %String.text
	
	undo_redo.create_action("Added prefix/suffix")
	for node in selection.get_selected_nodes():
		var node_name = node.name
		var new_name
		if position == false:
			new_name = renaming_string + node_name
		if position == true:
			new_name = node_name + renaming_string
		node.name = new_name
		
		undo_redo.add_do_property(node, "name", new_name)
		undo_redo.add_undo_property(node, "name", node_name)
	
	undo_redo.commit_action()
