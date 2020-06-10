import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    property int mouseAreaCronW: 5
    property int mouseAreaCronH: 5

    property alias cropArea: cropArea
    property alias mouseAreaDrag: mouseAreaDrag
    property alias mouseAreaLT: mouseAreaLT
    property alias mouseAreaTop: mouseAreaTop
    property alias mouseAreaRT: mouseAreaRT
    property alias mouseAreaRight: mouseAreaRight
    property alias mouseAreaRB: mouseAreaRB
    property alias mouseAreaButtom: mouseAreaButtom
    property alias mouseAreaLB: mouseAreaLB
    property alias mouseAreaLeft: mouseAreaLeft

    implicitWidth: 400
    implicitHeight: 400

    Rectangle {
        id: cropArea
        width: 200
        height: 200
        color: "#00000000"
        border.width: 1
        border.color: "#000000"

        MouseArea {
            id: mouseAreaLT
            width: mouseAreaCronW
            height: mouseAreaCronH
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            cursorShape: Qt.SizeFDiagCursor
        }

        MouseArea {
            id: mouseAreaTop
            height: mouseAreaCronH
            anchors.right: mouseAreaRT.left
            anchors.rightMargin: 0
            anchors.left: mouseAreaLT.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            cursorShape: Qt.SizeVerCursor
        }

        MouseArea {
            id: mouseAreaRT
            width: mouseAreaCronW
            height: mouseAreaCronH
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            cursorShape: Qt.SizeBDiagCursor
        }

        MouseArea {
            id: mouseAreaRight
            width: mouseAreaCronW
            anchors.bottom: mouseAreaRB.top
            anchors.bottomMargin: 0
            anchors.top: mouseAreaRT.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            cursorShape: Qt.SizeHorCursor
        }

        MouseArea {
            id: mouseAreaRB
            width: mouseAreaCronW
            height: mouseAreaCronH
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            cursorShape: Qt.SizeFDiagCursor
        }

        MouseArea {
            id: mouseAreaButtom
            height: mouseAreaCronH
            anchors.right: mouseAreaRB.left
            anchors.rightMargin: 0
            anchors.left: mouseAreaLB.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            cursorShape: Qt.SizeVerCursor
        }

        MouseArea {
            id: mouseAreaLB
            width: mouseAreaCronW
            height: mouseAreaCronH
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            cursorShape: Qt.SizeBDiagCursor
        }

        MouseArea {
            id: mouseAreaLeft
            width: mouseAreaCronW
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: mouseAreaLB.top
            anchors.bottomMargin: 0
            anchors.top: mouseAreaLT.bottom
            anchors.topMargin: 0
            cursorShape: Qt.SizeHorCursor
        }

        MouseArea {
            id: mouseAreaDrag
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.top: mouseAreaTop.bottom
            anchors.right: mouseAreaRight.left
            anchors.bottom: mouseAreaButtom.top
            anchors.left: mouseAreaLeft.right
            anchors.topMargin: 0
            cursorShape: Qt.SizeAllCursor
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    Image {
        id: bgCover
        fillMode: Image.PreserveAspectCrop
        source: "img_crop_cover.png"
        anchors.fill: parent
        smooth: true
        visible: false
    }

    Item {
        id: mask
        anchors.fill: parent
        Rectangle {
            id: maskCrop
            x: cropArea.x
            y: cropArea.y
            width: cropArea.width
            height: cropArea.height
        }
        visible: false
        smooth: true
    }

    OpacityMask {
        anchors.fill: parent
        invert: true
        source: bgCover
        maskSource: mask
    }
}




/*##^## Designer {
    D{i:3;anchors_width:100}D{i:10;anchors_height:100;anchors_width:100}
}
 ##^##*/
