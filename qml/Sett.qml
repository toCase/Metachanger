import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

Item {
    id: sett

    property int rH: 32
    Settings {
        location: "file:setting.ini"
        category: "list"
        property alias lname: sett_lname.text
    }

    Settings {
        location: "file:setting.ini"
        category: "row"
        property alias first: sett_frow.text
    }
    Settings {
        location: "file:setting.ini"
        category: "col"
        property alias old_file: sett_old.text
        property alias new_file: sett_new.text
        property alias title: sett_title.text
        property alias desc: sett_desc.text
        property alias keys: sett_keys.text
        property alias separator: sett_separator.text
    }
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 5
        Label {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH

            text: "Sheet:"
            font.pointSize: 11
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Sheet name:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_lname
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignHCenter
                text: "MetaData"                
            }
        }

        Label {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH

            text: "Rows:"
            font.pointSize: 11
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "First row:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_frow
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Item { Layout.fillWidth: true }
        }
        Label {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH

            text: "Columns:"
            font.pointSize: 11
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Old file:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_old
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "New file:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_new
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Title:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_title
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Description:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_desc
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Item { Layout.fillWidth: true }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: sett.rH
            Layout.maximumHeight: sett.rH
            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Keywords:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_keys
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: "1"
                validator: IntValidator {
                    top: 99
                    bottom: 1
                }
            }
            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Keys separator:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            TextField {
                id: sett_separator
                Layout.fillHeight: true
                Layout.minimumWidth: 60
                Layout.maximumWidth: 60
                horizontalAlignment: Qt.AlignHCenter
                text: ","
            }
            Item { Layout.fillWidth: true }
        }

        Item { Layout.fillHeight: true }
    }
}