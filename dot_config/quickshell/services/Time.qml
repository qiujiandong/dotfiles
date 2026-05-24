pragma Singleton

import Quickshell
import QtQml

Singleton {
  id: root

  property string time: Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss")

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
