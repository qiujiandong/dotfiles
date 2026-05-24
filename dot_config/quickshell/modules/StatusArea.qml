import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick

Row {
  id: root

  required property var hostWindow

  spacing: 6

  Repeater {
    model: SystemTray.items

    delegate: Item {
      id: trayItem

      required property var modelData

      visible: modelData.status !== Status.Passive
      width: visible ? 22 : 0
      height: 22

      Rectangle {
        anchors.fill: parent
        radius: 5
        color: mouseArea.containsMouse ? "#2a2a2a" : "transparent"
        border.width: modelData.status === Status.NeedsAttention ? 1 : 0
        border.color: "#ffffff"

        Behavior on color { ColorAnimation { duration: 120 } }
      }

      IconImage {
        anchors.centerIn: parent
        implicitSize: 16
        source: trayItem.modelData.icon
      }

      MouseArea {
        id: mouseArea

        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: function(mouse) {
          const menuPosition = trayItem.mapToItem(null, 0, trayItem.height)

          if (trayItem.modelData.onlyMenu && trayItem.modelData.hasMenu) {
            trayItem.modelData.display(root.hostWindow, menuPosition.x, menuPosition.y)
            return
          }

          if (mouse.button === Qt.RightButton) {
            if (trayItem.modelData.hasMenu) {
              trayItem.modelData.display(root.hostWindow, menuPosition.x, menuPosition.y)
            }
            return
          }

          if (mouse.button === Qt.MiddleButton) {
            trayItem.modelData.secondaryActivate()
            return
          }

          trayItem.modelData.activate()
        }
      }
    }
  }
}
