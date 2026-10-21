hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_THEME","rose-pine-hyprcursor")

hl.config({
    general = {
        border_size = 3,
        gaps_in = 0,
        gaps_out = 0,
        resize_on_border = true,
        col = {
            active_border = {colors = {"rgb(492E49)"}},
            inactive_border = {colors ={"rgba(00000000)"}},
        },
        allow_tearing = false,
        no_focus_fallback = false,
        layout = "hy3"
    },
    decoration = {
        rounding = 1,
        rounding_power = 1,

        inactive_opacity = 0.9,

        blur = {
            size= 3,
            ignore_opacity = false,
        }
    },
    misc = {
        force_default_wallpaper = false,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
    binds = {
        hide_special_on_workspace_change = true,
        workspace_center_on = 1,
    },
    cursor = {
        inactive_timeout = 3,
        persistent_warps = true,
    },
    ecosystem = {
        no_donation_nag = true,
    }
})

hl.curve( "inout", { type = "bezier", points = { {0.5, 1}, {0.5, 1} } })
hl.curve( "in", { type = "bezier", points = { {0, 1}, {0.25, 1} } })

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "inout" })
hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "in", style="slide" })
-- hl.animation({ leaf = window, enabled = true, speed = 10, spring = "bezier", style = "slide"})
hl.animation({ leaf = "fade", enabled = 0 })
    