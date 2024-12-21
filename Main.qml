import QtQuick
import "."

Window {
    width: 380
    height: 720
    visible: true
    title: qsTr("ToDoList")
    color: '#DF2935'
    Rectangle {
        id: background
        width: 360
        height: 700
        color: '#1A1A1A'
        radius: 10
        anchors.centerIn: parent
        Text{
            id: titr
            text: "To Do List"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            color: '#FFFFFF'
            font.bold: true
            y: 10
        }
        Rectangle{
            width: parent.width
            height: 0.5
            color: '#FFFFFF'
            y: 50
        }
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            y: 60
            ToDo{
                textToDo: "Test ToDo 1"
            }
            ToDo{
                textToDo: "Test ToDo 2"
            }
            ToDo{
                textToDo: "Test ToDo 3"
            }
        }
        Rectangle{
            width: parent.width - 20
            height: 50
            color: '#3A3A3A'
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            y: 640
            Row{
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                TextInput {
                    text: "New ToDo"
                    font.pixelSize: 14
                    color: '#FFFFFF'
                    anchors.verticalCenter: parent.verticalCenter
                    selectByMouse: true
                }
                Image {
                    source: "https://img.icons8.com/?size=100&id=zHoPnj4N4f6N&format=png&color=FFFFFF"
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                }
            }
        }
    }
}
