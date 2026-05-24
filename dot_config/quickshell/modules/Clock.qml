import QtQuick
import "../services" as Services

Text {
  text: Services.Time.time
  color: "#ffffff"
  font.pixelSize: 13
}
