import QtQuick
import qs
import Quickshell

Item{

    implicitWidth: timeText.width + dateText.width + 14
    implicitHeight: 10

    Text {
        id: timeText
        anchors {
             right: parent.right
             rightMargin: 10
             verticalCenter: parent.verticalCenter
        }
        font.pointSize: 12
        color: Colors.clock
        styleColor: Colors.clockOutline
        style: Text.Outline
        text: Qt.formatDateTime(clock.date, "hh:mm:ss")
    }
    Text {
        id: dateText
        anchors {
            right: timeText.left
            rightMargin: 4
            bottom: timeText.bottom
        }
        font.pointSize: 10
        color: Colors.clock
        text: Qt.formatDateTime(clock.date, "yyyy-MM-dd")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}