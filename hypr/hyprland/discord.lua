local discord_opacity = 0.8;

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
    opacity = discord_opacity,
    no_screen_share = true,
})

hl.bind("code:133", function() hl.window_rule({ name = "discord_rule", opacity = 1,}) end, {non_consuming=true, submap_universal=true})
hl.bind("SUPER + code:133", function() hl.window_rule({ name = "discord_rule", opacity = discord_opacity,}) end, {release=true, non_consuming=true, submap_universal=true})