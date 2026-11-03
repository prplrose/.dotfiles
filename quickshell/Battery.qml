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
            id: battery_bar
            property real animation_time: 1
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            implicitHeight:3
            implicitWidth: parent.width
            gradient: Gradient{
                GradientStop { position: battery_bar.animated(0.01); color: "#5BCFFB" }
                GradientStop { position: battery_bar.animated(0.19); color: "#5BCFFB" }
                GradientStop { position: battery_bar.animated(0.21); color: "#F5ABB9" }
                GradientStop { position: battery_bar.animated(0.39); color: "#F5ABB9" }
                GradientStop { position: battery_bar.animated(0.41); color: "#FFFFFF" }
                GradientStop { position: battery_bar.animated(0.59); color: "#FFFFFF" }
                GradientStop { position: battery_bar.animated(0.61); color: "#F5ABB9" }
                GradientStop { position: battery_bar.animated(0.79); color: "#F5ABB9" }
                GradientStop { position: battery_bar.animated(0.81); color: "#5BCFFB" }
                GradientStop { position: battery_bar.animated(0.99); color: "#5BCFFB" }
                orientation: Gradient.Horizontal
            }

            function animated(position){
                if (UPower.displayDevice.state != UPowerDeviceState.Charging){
                    return position;
                }
                let scaled = (5*position/4) - (1/12)
                scaled = Math.min(1, Math.max(0,scaled))
                return 1-(scaled+battery_bar.animation_time)%1;
            }

            Timer{
                interval: 30;
                running: UPower.displayDevice.state == UPowerDeviceState.Charging;
                repeat: true;
                onTriggered: battery_bar.animation_time+=UPower.displayDevice.changeRate/5000;
            }

            Rectangle{
                id: depletion_bar
                implicitHeight: 3
                implicitWidth: parent.width

                function get_percent(){
                    if (UPower.displayDevice.state == UPowerDeviceState.Unknown){
                        return 1
                    }
                    return UPower.displayDevice.percentage
                }

                gradient: Gradient{
                    GradientStop { position: 0; color: depletion_bar.get_percent()==1 ? "transparent" : Colors.workspace}
                    GradientStop { position: 1.0-depletion_bar.get_percent()-0.005; color: depletion_bar.get_percent()==1 ? "transparent" : Colors.workspace}
                    GradientStop { position: 1.0-depletion_bar.get_percent()+0.005; color: "transparent"}
                    GradientStop { position: 1.0; color: "transparent" }
                    orientation: Gradient.Horizontal
                }
            }
        }

    }
}