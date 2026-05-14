import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Services.UPower

Scope{
    required property string state
    id: root
    PanelWindow{
        WlrLayershell.layer: WlrLayer.Overlay
        mask: Region {}
        anchors{
            bottom: true
            right: true
        }
        color: "transparent"
        implicitWidth: screen.width
        Rectangle{
            id: rere
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            implicitHeight:3
            implicitWidth: parent.width
            gradient: Gradient{
                GradientStop { position: 0.19; color: "#5BCFFB" }
                GradientStop { position: 0.21; color: "#F5ABB9" }
                GradientStop { position: 0.39; color: "#F5ABB9" }
                GradientStop { position: 0.41; color: "#FFFFFF" }
                GradientStop { position: 0.59; color: "#FFFFFF" }
                GradientStop { position: 0.61; color: "#F5ABB9" }
                GradientStop { position: 0.79; color: "#F5ABB9" }
                GradientStop { position: 0.81; color: "#5BCFFB" }
                GradientStop { position: 1.0; color: "#5BCFFB" }
                orientation: Gradient.Horizontal
            }
            Rectangle{
                id: battery_bar
                implicitHeight: 3
                implicitWidth: parent.width
                
                gradient: Gradient{
                    GradientStop { position: 3/parent.width+0.005; color: Colors.workspace }
                    GradientStop { position: 1-UPower.displayDevice.percentage-0.005; color: "#0e1329" }
                    GradientStop { position: 1-UPower.displayDevice.percentage+0.005; color: '#34000000' }
                    GradientStop { position: 1.0; color: "#00000000" }
                    orientation: Gradient.Horizontal
                }
            }
        }

    }
}