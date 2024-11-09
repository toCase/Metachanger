import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: app

    property color clr_black: "#000000"
    property color clr_white: "#FFFFFF"
    property color clr_grey: "#009688"
    

    QtObject {
        id: internal

        function setMeta() {
            app_stack.pop()
            app_stack.push(app_meta)
            app.state = "META"
        }

        function setSett() {
            app_stack.pop()
            app_stack.push(app_sett)
            app.state = "SETT"
        }
    }

    state: "META"
    states: [
        State {
            name: "META"
            PropertyChanges {target: but_meta; color: app.clr_grey}
            PropertyChanges {target: but_sett; color: app.clr_white}
            PropertyChanges {target: label_meta; color: app.clr_black}
            PropertyChanges {target: label_sett; color: app.clr_grey}

        },
        State {
            name: "SETT"
            PropertyChanges {target: but_meta; color: app.clr_white}
            PropertyChanges {target: but_sett; color: app.clr_grey}
            PropertyChanges {target: label_meta; color: app.clr_grey}
            PropertyChanges {target: label_sett; color: app.clr_black}
        }
    ]

    Rectangle {
        id: background

        anchors.fill: parent
        color: "#f9f1ed"

        ColumnLayout {
            anchors.fill: parent
            spacing: 5

            RowLayout {
                Layout.fillWidth: true
                Layout.minimumHeight: 30
                Layout.maximumHeight: 30

                spacing: 0

                Rectangle {
                    id: but_meta
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    bottomLeftRadius: 30
                    bottomRightRadius: 30

                    border.color: app.clr_grey
                    border.width: 0

                    Text {
                        id: label_meta
                        anchors.centerIn: parent
                        text: "METADATA"
                        font.bold: true
                        font.pointSize: 9
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: { internal.setMeta() }
                        onHoveredChanged: {
                            but_meta.border.width = containsMouse ? 2 : 0
                        }
                    }
                }

                Rectangle {
                    id: but_sett
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    bottomLeftRadius: 30
                    bottomRightRadius: 30

                    border.color: app.clr_grey
                    border.width: 0

                    Text {
                        id: label_sett
                        anchors.centerIn: parent
                        text: "SETTING"
                        font.bold: true
                        font.pointSize: 9
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: { internal.setSett() }
                        onHoveredChanged: {
                            but_sett.border.width = containsMouse ? 2 : 0
                        }
                    }
                }
            }

            StackView {
                id: app_stack
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: 15
                initialItem: initer

                pushEnter: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to:1
                        duration: 200
                    }
                }
                pushExit: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 1
                        to:0
                        duration: 200
                    }
                }
                popEnter: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to:1
                        duration: 200
                    }
                }
                popExit: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 1
                        to:0
                        duration: 200
                    }
                }

            }
        }
    }

    Item { id: initer }

    Meta {
        id: app_meta
        visible: false
    }

    Sett {
        id: app_sett
        visible: false
    }

    Component.onCompleted: app_stack.push(app_meta)

}