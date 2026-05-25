hl.config({
input = {
    kb_layout = "pl",
    numlock_by_default = true,
    focus_on_close = 1
}
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })

hl.device({
    name = "elan-trackpoint",
    sensitivity = -0.6,
})