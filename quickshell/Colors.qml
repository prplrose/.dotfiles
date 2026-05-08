pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool b_pope: false
    property bool pope: f_pope()

    property color bar: pope ? "#f5ec86" : "#24112d"

    property color clockOutline: pope ? "transparent" : "#88474747"
    property color clock: pope ? "#121212" : "#ffffff"

    property color battery: "#ffffff"

    property color workspace: pope? "#655b00" :"#4f3466"
    property color workspaceText: "#ffffff"
    property color workspaceBorder: "#b99bd5"
    
    property color workspaceActive: pope ? "#fefac5" : "#cf62e7"
    property color workspaceActiveText: "#19191a"
    property color workspaceActiveBorder: "#b99bd5"

    property color workspaceUrgent: pope? "#002137" : "#7b8044"
    property color workspaceUrgentText: "#fefff8"
    property color workspaceUrgentBorder: "#cfd86f"

    property color notification: bar

    function f_pope(): bool {
        if ((clock.hours == 21 && clock.minutes == 37)){
            b_pope = true
        }
        else{
            b_pope = false
        }
        hyprRecolor.running = true
        return b_pope
    }

    SystemClock{
        id: clock
        precision: SystemClock.Minutes
    }

    Process {
        id: hyprRecolor
        command: {
                if (b_pope){
                    ["hyprctl", "keyword", "general:col.active_border", "0xfff5ec86"]
                }
                else{
                    ["hyprctl", "keyword", "general:col.active_border", "0xff4f3466"]
                }
        }
        running: false
    }
}
