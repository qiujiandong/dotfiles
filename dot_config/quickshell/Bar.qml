import Quickshell
import QtQuick
import "modules"

Variants {
  model: Quickshell.screens

  PanelWindow {
    id: panel

    required property var modelData

    screen: modelData
    implicitHeight: 30
    color: "#111111"

    anchors {
      top: true
      left: true
      right: true
    }

    Workspaces {
      anchors {
        left: parent.left
        leftMargin: 8
        verticalCenter: parent.verticalCenter
      }
    }

    Clock {
      anchors.centerIn: parent
    }

    StatusArea {
      hostWindow: panel

      anchors {
        right: parent.right
        rightMargin: 8
        verticalCenter: parent.verticalCenter
      }
    }
  }
}
