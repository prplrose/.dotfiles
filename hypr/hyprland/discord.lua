hl.bind("SUPER + D", function() 
    hl.dispatch(hl.dsp.workspace.toggle_special("discord"))
    hl.dispatch(hl.dsp.submap("discord"))
end)

hl.define_submap("discord", function()
    hl.bind("SUPER + D", function()
        hl.dispatch(hl.dsp.workspace.toggle_special("discord"))
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end)

hl.window_rule({
    name = "discord_rule",
    match = {
        class = "discord"
    },
    workspace = "special:discord",
    no_initial_focus = true,
    opacity = 0.85,
    no_screen_share = true,
})