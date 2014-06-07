tell application "System Events" to tell process "sixtyforce"
	open ":Users:mrasmus:emu:savestates:current.n64Freeze"
	repeat until (name of window 1) as string is ""
	end repeat
	tell window 1 to click button "Disable Autosave"
	tell menu bar item "File" of menu bar 1 to click menu item "Run" of menu 1
end tell
