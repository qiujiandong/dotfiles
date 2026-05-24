import Quickshell.Hyprland
import QtQuick

Row {
  spacing: 3

  Repeater {
    model: Hyprland.workspaces

    delegate: Item {
      id: wsButton

      required property var modelData

      width: 40
      height: 22

      Rectangle {
        anchors.fill: parent
        radius: 4
        color: {
          if (modelData.focused) return "#ffffff"
          if (modelData.windows > 0) return "#3a3a3a"
          return "transparent"
        }
        border.color: {
          if (modelData.focused) return "#ffffff"
          if (modelData.windows > 0) return "#ffffff"
          return "#555555"
        }
        border.width: 1
        opacity: modelData.focused ? 1 : (modelData.windows > 0 ? 0.9 : 0.6)

        Behavior on color { ColorAnimation { duration: 150 } }
        Behavior on opacity { NumberAnimation { duration: 150 } }
      }

      Text {
        anchors.centerIn: parent
        text: modelData.name.length > 4 ? modelData.name.substring(0, 4) + "..." : modelData.name
        color: modelData.focused ? "#111111" : "#ffffff"
        font.pixelSize: 13
        font.bold: modelData.focused
      }

      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: wsButton.modelData.activate()
        onEntered: parent.scale = 1.15
        onExited: parent.scale = 1.0
      }
    }
  }
}
