
using terms from application "Quicksilver"
	on process text slotName_
		do shell script "cd ~/emu/savestates/; ln -sf " & slotName_ & ".n64Freeze current.n64Freeze"
		tell application "System Events"
			set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
		end tell
		if isRunning then
			tell application id "com.Growl.GrowlHelperApp"
				set the allNotificationsList to ¬
					{"Savestate Slot Notification"}
				
				set the enabledNotificationsList to ¬
					{"Savestate Slot Notification"}
				
				register as application ¬
					"Savestate Slot Changer" all notifications allNotificationsList ¬
					default notifications enabledNotificationsList ¬
					icon of application "sixtyforce"
				
				notify with name ¬
					"Savestate Slot Notification" title ¬
					"Savestate Slot Changed" description ¬
					"Now using slot " & slotName_ & "." application name "Savestate Slot Changer"
				
			end tell
		end if
	end process text
end using terms from

