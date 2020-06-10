import QtQuick 2.12
import QtQuick.Window 2.12
import QOT.SimpleCombox 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("SimpleCombox sample")

    SimpleCombox{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        textRole:"display"
        comboxMode: ListModel{
            ListElement {
                name: "item-1"
                display:"Item 1"
            }
            ListElement {
                name: "item-2"
                display:"Item 2"
            }
            ListElement {
                name: "item-3"
                display:"Item 3"
            }
        }
    }
}
