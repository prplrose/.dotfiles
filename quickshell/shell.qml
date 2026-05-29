import Quickshell
import Quickshell.Hyprland
import qs.Bar
import QtQuick

ShellRoot {
    id: root

    property Bar bar: Bar{}
    property Battery battery: Battery{}
    property Audio audio: Audio{}

    GlobalShortcut {
        name: "bar"
        description: "test"

        onPressed: {
            bar.visible = true
            bar.barState = "enabled"
        }

        onReleased: {
            bar.visible = false
            bar.barState = "disabled"
        }
    }

}