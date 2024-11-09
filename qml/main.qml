import QtQuick
import QtQuick.Window
import QtCore


Window {
    id: window
    width: 640
    height: 900
    visible: true
    title: qsTr("Metadata Changer")

    App {
        anchors.fill: parent
    }

    Settings {
        id: setting
        location: "file:setting.ini"

        category: "app"
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }
    
}