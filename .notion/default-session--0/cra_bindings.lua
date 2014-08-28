-- cramur's ion3 bindingsl

--[[

### OVERVIEW ###

By mapping the virtual desktops to a grid on the left hand, rapid
to specific desktops is not only possible, but becomes second nature.

These bindings are designed to be as comfortable as possible from 
a Dvorak Programming keyboard layout. 

Installation:

   dopath("cra_bindings")

--]]


-- MAIN BINDINGS

--[[

This is the physical layout of the grid layout. The number in the upper-
right hand corner represents the workspace number. Obviously on a Dvorak
keyboard, the actual letters are different, but they do not really 
matter to us. 
 ___________....
|  0|  1|  2|   .
| 1 | 2 | 3 | 4 .
|___|___|___|....
 |  3|  4|  5|   .
 | Q | W | E | R .
 |___|___|___|____
  |  6|  7|  8|  9|
  | A | S | D | F |
  |___|___|___|___|

--]]

defbindings("WScreen", {
	bdoc("Navigate to the left/right workspace."),
	--kpress(ALTMETA.."Shift+H", "WScreen.switch_prev(_)"),
    --kpress(ALTMETA.."Shift+N", "WScreen.switch_next(_)"),

	bdoc("My scheme of navigation (top-bottom-and-two-laterals,and one more lateral)"),
	kpress(ALTMETA.."Shift+T", "WScreen.switch_nth(_, 2)"),
	kpress(ALTMETA.."Shift+S", "WScreen.switch_nth(_, 3)"),
	kpress(ALTMETA.."Shift+minus", "WScreen.switch_nth(_, 4)"),

    bdoc("Navigate workspaces using a Dvorak grid-based metaphor."),
    kpress(ALTMETA.."ampersand", "WScreen.switch_nth(_, 0)"),
    kpress(ALTMETA.."bracketleft", "WScreen.switch_nth(_, 1)"),
    kpress(ALTMETA.."braceleft", "WScreen.switch_nth(_, 2)"),
    kpress(ALTMETA.."semicolon", "WScreen.switch_nth(_, 3)"),
    kpress(ALTMETA.."comma", "WScreen.switch_nth(_, 4)"),
    kpress(ALTMETA.."period", "WScreen.switch_nth(_, 5)"),

    kpress(ALTMETA.."Shift+h", "WScreen.switch_nth(_, 0)"),
    kpress(ALTMETA.."Shift+t", "WScreen.switch_nth(_, 1)"),
    kpress(ALTMETA.."Shift+n", "WScreen.switch_nth(_, 2)"),
    kpress(ALTMETA.."Shift+r", "WScreen.switch_nth(_, 3)"),

})

defbindings("WMPlex", {
    bdoc("Toggle fullscreen mode of current client window."),
    kpress(META.."Return", 
                "WGroup.set_fullscreen(_, 'toggle')"),
    bdoc("Query for command line to execute."),
    kpress(ALTMETA.."R", "mod_query.query_exec(_)"),

    bdoc("Query for host to connect to with SSH."),
    kpress(ALTMETA.."S", "mod_query.query_ssh(_, ':ssh')"),

    bdoc("Run an unicode terminal emulator."),
    kpress(ALTMETA.."Shift+space", "ioncore.exec_on(_, 'urxvt -T utf')"),

    bdoc("Run an koi-8 terminal emulator."),
    kpress(META.."Shift+space", "ioncore.exec_on(_, 'LC_ALL=ru_RU.koi8r urxvt -T koi')"),

	bdoc("Run firefox"),
	kpress(ALTMETA.."Shift+b", "ioncore.exec_on(_, 'firefox')"),

	bdoc("slock screen"),
	kpress(ALTMETA.."Shift+L", "ioncore.exec_on(_, 'xkb-switch -s dvp && slock')"),

	bdoc("alsamixer in urxvtc"),
	kpress(ALTMETA.."Shift+V", "ioncore.exec_on(_, 'urxvtc -e alsamixer')"),

	bdoc("wifi menu"),
	kpress(ALTMETA.."Shift+W", "ioncore.exec_on(_, 'urxvtc -e sudo wifi-menu')"),
})

defbindings("WFrame", {

    -- An exercise for my little finger, heh :)
    bdoc("Switch to next/previous object within the frame."),
    kpress(ALTMETA.."at", "WFrame.switch_next(_)"),
    kpress(ALTMETA.."slash", "WFrame.switch_prev(_)"),

    bdoc("Attach tagged frames."),
    kpress(META.."Shift+T", "ioncore.tagged_attach(_)"),
 })

-- ionws

defbindings("WTiling", {

    -- I don't use this much, but I'll leave it in case I need it someday
--[[
    bdoc("Split current frame vertically."),
    kpress(ALTMETA.."N", "WTiling.split_at(_, _sub, 'bottom', true)"),
    kpress(ALTMETA.."P", "WTiling.split_at(_, _sub, 'top', true)"),

    bdoc("Split current frame horizontally."),
    kpress(ALTMETA.."F", "WTiling.split_at(_, _sub, 'right', true)"),
    kpress(ALTMETA.."B", "WTiling.split_at(_, _sub, 'left', true)"),
]]--

    bdoc("Go to frame above/below/right/left of current frame."),
    kpress(ALTMETA.."C", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(ALTMETA.."T", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),

    kpress(ALTMETA.."H", "ioncore.goto_next(_sub, 'left', {no_ascend=_})"),
    kpress(ALTMETA.."N", "ioncore.goto_next(_sub, 'right', {no_ascend=_})")
})
