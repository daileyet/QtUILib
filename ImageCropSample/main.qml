import QtQuick 2.12
import QtQuick.Window 2.12
import QOT.ImageCrop 1.0

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#6d5b5b"
    title: qsTr("Hello World")

    Item {
        id: ctls
        height: 50
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Rectangle {
            id: buttonLoad
            width: 100
            height: 25
            color: "#454545"
            border.color: "#636363";
            border.width: 1;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 5;
            Text {
                id: load
                color: "#ffffff"
                text: qsTr("Load")
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 12
            }

            MouseArea{
                anchors.fill: parent;
                hoverEnabled: true;
                onEntered: {

                }
                onExited: {

                }

                onPressed: {
                    buttonLoad.state="Press";
                }

                onReleased: {
                    buttonLoad.state="Release";
                }
            }

            states: [

                State {
                    name: "Press"
                    PropertyChanges {
                        target: buttonLoad
                        border.width: 1;
                        border.color: "#396acc";
                        color:"#333333";
                    }
                },
                State {
                    name: "Release"
                    PropertyChanges {
                        target: buttonLoad
                        border.width: 1;
                        border.color: "#636363";
                        color:"#454545";
                    }
                }
            ]
        }
    }

    ImageCrop{
        width: 500
        height: 350
        cropBorderColor: "#fffff0"
        cropImageSource: "qrc:/Penguins.jpg"

        onCropRectChanged:{
            console.log(cropRect)
        }
    }


}


















