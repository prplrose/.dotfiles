import QtQuick
import Quickshell.Hyprland
import qs
// import qs.Colors

Row{
    spacing: 3
    Repeater{
        model: Hyprland.workspaces
        Rectangle {
            width: 20; height: 20
            radius: 5
            color: modelData.active ? Colors.workspaceActive : modelData.urgent ? Colors.workspaceUrgent : Colors.workspace
            border.color: modelData.active ? Colors.workspaceActiveBorder : modelData.urgent ? Colors.workspaceUrgentBorder : Colors.workspaceBorder
            property bool isLogo: modelData.name=="discord"
            Text{
                visible: !isLogo
                text: modelData.name
                color: modelData.active ? Colors.workspaceActiveText : modelData.urgent ? Colors.workspaceUrgentText : Colors.workspaceText
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Image{
                visible: isLogo
                source: "./Discord-Symbol-White.svg"
                width: parent.width-4
                height: parent.height-4
                fillMode: Image.PreserveAspectFit
                mipmap: true
                anchors{
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}