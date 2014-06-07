tell application "System Events" to tell process "sixtyforce"
	tell menu bar item "File" of menu bar 1
		click menu item "Reset" of menu 1
		click menu item "Run" of menu 1
	end tell
end tell
