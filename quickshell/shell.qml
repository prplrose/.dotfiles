import Quickshell
import Quickshell.Hyprland
import qs.Bar
import QtQuick

ShellRoot {
    id: root

    property Bar bar: Bar{}
    property Battery battery: Battery{}
    property Audio audio: Audio{}
    property BatteryVignette batteryVignette: BatteryVignette{}

    GlobalShortcut {
        name: "bar"
        description: "test"

        onPressed: {
            bar.barState = "enabled"
        }

        onReleased: {
            bar.barState = "disabled"
        }
    }

}