import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Services.UPower

Scope{
    PanelWindow{
        WlrLayershell.layer: WlrLayer.Overlay
        mask: Region {}
        color: "transparent"
        implicitHeight: screen.height
        implicitWidth: screen.width
        Image{
            property real lt: 0.1
            property real ht: 0.15
            property real s: 1
            property real p: UPower.displayDevice.percentage
            property real multiplier: Math.max(0,Math.min(1,(p-ht)/(-s*p-ht+lt+s*lt)))
            opacity: Math.sin(time)*multiplier
            source: "./BatteryVignette.svg"
            width: parent.width-4
            height: parent.height-4
            fillMode: Image.PreserveAspectFit
            mipmap: true
            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            property real time: 0
            Timer{
                interval: 20;
                running: true;
                repeat: true;
                onTriggered: parent.time=parent.time+0.05;
            }
        }
    }
}