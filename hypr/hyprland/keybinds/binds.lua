local hy3 = hl.plugin.hy3
require("hyprland.keybinds.default")

hl.bind("SUPER + code:133", hl.dsp.global("quickshell:bar"), {non_consuming=true, submap_universal=true})
hl.bind("SUPER + code:133", hl.dsp.global("quickshell:bar"), {release=true, non_consuming=true, submap_universal=true})

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}), {submap_universal=true})
    hl.bind("SUPER + " .. key,             hl.dsp.submap("reset"), {submap_universal=true})
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }), {submap_universal=true})
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), {submap_universal=true})
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), {submap_universal=true})

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, submap_universal=true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, submap_universal=true })

hl.bind("SUPER + left", hl.dsp.focus({direction = "left"}), {submap_universal=true})
hl.bind("SUPER + right", hl.dsp.focus({direction = "right"}), {submap_universal=true})
hl.bind("SUPER + up", hl.dsp.focus({direction = "up"}), {submap_universal=true})
hl.bind("SUPER + down", hl.dsp.focus({direction = "down"}), {submap_universal=true})

hl.bind("SUPER + SHIFT + left", hy3.move_window("left"), {submap_universal=true})
-- hl.bind("SUPER + c", hy3.debug_nodes(), {submap_universal=true})
hl.bind("SUPER + SHIFT + right", hy3.move_window("right"), {submap_universal=true})
hl.bind("SUPER + SHIFT + up", hy3.move_window("up"), {submap_universal=true})
hl.bind("SUPER + SHIFT + down", hy3.move_window("down"), {submap_universal=true})

hl.bind("SUPER + SHIFT + Delete", hl.dsp.window.kill(), {submap_universal=true})


hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true, submap_universal=true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true, submap_universal=true })


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"), {repeating = true, submap_universal=true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), {repeating = true, submap_universal=true})
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true, submap_universal=true})

-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })

hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -z --clipboard-only"), {submap_universal=true})