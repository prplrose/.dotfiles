import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Effects
import Quickshell.Wayland
import Quickshell.Hyprland
import qs

Scope{
    id: root
    // required property color color
    property bool visible: false
    property string barState: "disabled"

    // Time{id: timeSource}
    Variants{
        model: Quickshell.screens
        PanelWindow {
            
            WlrLayershell.layer: WlrLayer.Overlay
            // HyprlandWindow.opacity: 0.8
            // HyprlandWindow.visibleMask: Region{width: 1920; height: 1080}
            required property var modelData
            screen: modelData
            visible: root.visible

            anchors {
                top: true
                left: true
            }

            implicitHeight: 30
            implicitWidth: screen.width
            color: "transparent"

            Rectangle{
                id: barRect
                implicitHeight: parent.height
                implicitWidth: parent.width

                color: Colors.bar

                ClockWidget{
                    id: clockWidget
                    anchors {
                        right: parent.right
                        // rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                }

                WorkspacesWidget{
                    anchors{
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                }
                state: root.barState
                states: [
                    State {
                        name: "disabled"
                        PropertyChanges {
                            target: barRect
                            y: -30
                        }
                    },
                    State {
                        name: "enabled"
                        PropertyChanges {
                            target: barRect
                            y: 0
                        }
                    }
                ]
                transitions: [
                    Transition{
                        from: "*"
                        to: "*"
                        PropertyAnimation{
                            target: barRect
                            properties: "y"
                            duration: 150
                        }
                    }
                ]

            }

            
        }
    }
    
}