tell application "System Events" to tell process "sixtyforce"
	set frontmost to true
	tell menu bar item "File" of menu bar 1
		click menu item "Save Game Freeze…" of menu 1
	end tell
	repeat until window "Save" exists
	end repeat
	tell window "Save"
		set (value of (text field 1)) to "current.n64Freeze"
		click button "Save"
		repeat until sheet 1 exists
		end repeat
		tell sheet 1 to click button "Replace"
	end tell
end tell
