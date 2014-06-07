sixtyforce-utils
================

Savestate/Shortcut Utilities for sixtyforce (OS X N64 emulator)

Savestate Slot Emulation
----------------
The registered version of sixtyforce allows the user to use savestates (called "Game Freezes" by the software), but they are poorly implemented as a file save/file load interface: Saving a state is a multi-step process involving a dialog box and manual naming, and loading states is menu-and-name-driven as well. These scripts attempt to solve both problems by working with Quicksilver for a hotkey-driven, slot-based workflow (more aligned with common emulator practices). The result allows much faster quicksave/quickload functionality, useful for speedrunners and other impatient gamers.

**Installation** (Requires [Growl](http://growl.info/) and [Quicksilver](http://qsapp.com/))
- Make a directory for your savestates to reside in (I use "~/emu/savestates/"; edit changesaveslot.applescript to reflect your preference).
- Create a Game Freeze (.n64Freeze) file in that directory for each slot you wish to have (e.g. 1.n64Freeze, 2.n64Freeze, etc).
- Modify loadsavestate.applescript with the full path of your savestates directory (leave "current.n64Freeze" as the filename, we're about to create that; if you used ~/emu/savestates/, you'll just have to replace "mrasmus" with your username).
- Compile the scripts by running build.sh, copy the .scpt files from bin/ into whatever folder you want to store them in for use (I have a "~/bin/" folder for these and other scripts). Make sure Quicksilver catalogs whatever folder they end up in (and Scripts are enabled).
- Launch changesavestateslot.scpt once via Quicksilver, passing it one of the slot names (no extension) in the "third box" (e.g. "1" for 1.n64Freeze).
    - This creates a symbolic link in your savestates directory to that slot called "current.n64Freeze". If you load it, it will be the same as whatever freeze file you passed in.
- Configure Quicksilver triggers:
    - Go into the Triggers menu of QuickSilver and create a HotKey for loadsavestate and savesavestate (e.g. ⌥S and ⌥L)
    - Add one changesavestateslot HotKey for each slot (passing the savestate name, again without extension, into box 3 for each). I recommend ⌥1 - ⌥0, mapping to 1.n64Freeze through 0.n64Freeze.
- I'd recommend all of these hotkeys to be scoped to only run when sixtyforce is frontmost (Scope -> "Enable in selected applications").

**Usage**
Use the Change Slot hotkeys to select which slot you want to operate on; you should get a Growl notification confirming the slot selection. Save and Load hotkeys will now use that slot -- hitting your Save hotkey will overwrite whatever was previously there, and Load will load the contents of that slot. Easy as that.

A couple notes:
- These scripts get a little funky if you have something other than the main emulation window open (like the properties dialog) in sixtyforce.
- The Save functionality also assumes that the Save Game Freeze dialog starts in the correct folder (where your current.n64Freeze exists). If it stops working, try saving another freeze in that folder again (to remind sixtyforce where to start).
- Loading a savestate disables Autosave functionality, but that can easily be reverted by modifying the script if you'd prefer to retain it.

Utility Scripts
----------------
Also included are a Quit script and a Reset script -- they're simple utilities to fix the fact that the Quit hotkey seems broken in sixtyforce (ugh), and the Reset function doesn't even get one by default. The Reset script has the added functionality of auto-launching emulation ("Run" from the menu) after sending the console reset signal, because seriously, why is that "loaded but not running" state even a thing? Who wants that?

The scripts don't need customization -- just build them with build.sh, copy the .scpt's from bin/ into somewhere, and use Quicksilver Triggers to bind them to hotkeys. 
