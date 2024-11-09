import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Dialogs

Item {
    id: meta

    property int rH: 32


    QtObject {
        id: internal 

        function selectFolder(folderURL) {
            var folderDir = misc.changeURL(folderURL)

            if (meta_folder.text === folderDir) {
                return
            }
            meta_folder.text = folderDir
            var res = misc.getFolderInfo(folderDir)
            protocol.text = protocol.text + res

            enableTest()
        }

        function selectTarget(folderURL){
            var targetDir = misc.changeURL(folderURL)
            meta_target.text = targetDir

            enableTest()
        }
            

        function selectFile(fileUrl) {
            var fileXLS = misc.changeURL(fileUrl)
            
            if (meta_file.text === fileXLS) {
                return
            }

            meta_file.text = fileXLS

            var res = xlsWorker.setFileName(fileXLS)
            protocol.text = protocol.text + res

            enableTest()
        }

        function enableTest(){
            if (meta_folder.text === ""){
                but_change.enabled = false
                return
            }
            if (meta_target.text === ""){
                but_change.enabled = false
                return
            }
            var fstatus = xlsWorker.getStatus()
            if (fstatus === false){
                but_change.enabled = false
                return
            }
            but_change.enabled = true
        }

        function changeMetaData() {
            var params = {}
            params['source'] = meta_folder.text
            params['target'] = meta_target.text
            params['xls'] = meta_file.text

            progress.visible = true
            progress.value = 0

            metaChanger.setParams(params)
            metaChanger.start()
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 5
        spacing: 5

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: meta.rH
            Layout.maximumHeight: meta.rH

            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Source Folder:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter

            }

            TextField {
                id: meta_folder
                Layout.fillHeight: true
                Layout.fillWidth: true
                readOnly: true
            }

            ToolButton {
                Layout.fillHeight: true
                Layout.minimumWidth: meta.rH
                Layout.maximumWidth: meta.rH
                text: "..."
                onClicked: folderDialog.open()
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: meta.rH
            Layout.maximumHeight: meta.rH

            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Target Folder:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter

            }

            TextField {
                id: meta_target
                Layout.fillHeight: true
                Layout.fillWidth: true
                readOnly: true
            }

            ToolButton {
                Layout.fillHeight: true
                Layout.minimumWidth: meta.rH
                Layout.maximumWidth: meta.rH
                text: "..."
                onClicked: targetDialog.open()
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.minimumHeight: meta.rH
            Layout.maximumHeight: meta.rH

            spacing: 5

            Label {
                Layout.fillHeight: true
                Layout.minimumWidth: 120
                Layout.maximumWidth: 120

                text: "Excel file:"
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter

            }

            TextField {
                id: meta_file
                Layout.fillHeight: true
                Layout.fillWidth: true
                readOnly: true
            }

            ToolButton {
                Layout.fillHeight: true
                Layout.minimumWidth: meta.rH
                Layout.maximumWidth: meta.rH
                text: "..."
                onClicked: fileDialog.open()
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ScrollView {
                id: view
                anchors.fill: parent

                TextArea {
                    id: protocol
                    text: ""
                    horizontalAlignment: Qt.AlignLeft
                    verticalAlignment: Qt.AlignTop
                    readOnly: true
                }
            }
        }

        ProgressBar {
            id: progress
            visible: false
            Layout.fillWidth: true
            Layout.minimumHeight: 5
            Layout.maximumHeight: 5
        }

        RowLayout {
            Layout.fillWidth:true
            Layout.minimumHeight: 50
            Layout.maximumHeight: 50
            spacing: 5

            Item { Layout.fillWidth: true }
            Button {
                id: but_change
                Layout.fillHeight:true
                Layout.minimumWidth: implicitWidth
                Layout.maximumWidth: implicitWidth

                enabled: false

                Material.background: Material.Teal
                Material.roundedScale: Material.ExtraSmallScale

                text: "CHANGE META"

                onClicked: internal.changeMetaData()
            }

        }


    }

    Connections {
        target: metaChanger
        function onProgressChange(value) {
            progress.value = value           
        }
        function onFinishChange(res) {
            protocol.text = protocol.text + res
            progress.visible = false
        }
    }

    FolderDialog {
        id: folderDialog
        onAccepted: internal.selectFolder(selectedFolder)
    }
    FolderDialog {
        id: targetDialog
        onAccepted: internal.selectTarget(selectedFolder)
    }

    FileDialog {
        id: fileDialog
        fileMode: FileDialog.OpenFile
        nameFilters: ["Excel file (*.xlsx *.xlsm)"]
        onAccepted: internal.selectFile(selectedFile)
    }
    
}