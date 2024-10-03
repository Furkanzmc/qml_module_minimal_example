import QtQuick
import QtQuick.Window
import Rectangles

Window {
    id: root
    width: 300
    height: 300
    visible: true

    Row {
        anchors.fill: parent

        // QML type
        BlueRectangle {
            width: 100
            height: parent.height
        }

        // C++ type
        EmptyItem {
            width: 100
            height: parent.height
        }

        // QML type
        YellowRectangle {
            width: 100
            height: parent.height
        }
    }
}
