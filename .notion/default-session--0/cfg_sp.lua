
defbindings("WScreen", {
    bdoc("Toggle scratchpad."),
    kpress(META.."numbersign", "mod_sp.set_shown_on(_, 'toggle')"),

    kpress(META.."dollar", "named_scratchpad(_, 'scihandy')"),
    kpress(ALTMETA.."Shift+C", "named_scratchpad(_, 'chitchat')"),

})

