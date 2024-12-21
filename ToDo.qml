import QtQuick
import QtQuick.Controls

Item {
    id: mainItem
    property string textToDo: "Test To Do Text"
    width: 340
    height: 50
    anchors.horizontalCenter: parent.horizontalCenter
    Rectangle{
        id: boxToDo
        width: 340
        height: 50
        color: '#3A3A3A'
        radius: 10
        Row{
            id: toDo
            anchors.fill: parent
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            CheckBox {
                id: isDo
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                checkState: Qt.Unchecked
                focus: false
                focusPolicy : Qt.NoFocus
                contentItem: Text{
                    id: toDoText
                    text: mainItem.textToDo
                    font.pixelSize: 14
                    color: '#FFFFFF'
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 20
                }
            }
            Item{
                width: 110
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                opacity: 0
            }
            Image {
                id: editIcon
                source: "https://img.icons8.com/?size=100&id=AuMLFRmG95tQ&format=png&color=FFFFFF"
                width: 16
                height: 16
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: 10
                anchors.right: deleteIcon.left
            }
            Image {
                id: deleteIcon
                source: "https://img.icons8.com/?size=100&id=DU8dSXkvLUkx&format=png&color=FFFFFF"
                width: 16
                height: 16
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }
    }
}
