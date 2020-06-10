import QtQuick 2.0

Rectangle{
    property string cropImageSource:""
    property color cropBorderColor: "#ffffff"
    property alias cropper: imageCrop
    property rect cropRect: imageCrop.getCropRect()

    id:imageContainer;
    width: 500
    height: 350
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    Image{
        anchors.fill: parent;
        id:imageObj
        fillMode: Image.PreserveAspectFit
        source: cropImageSource
        onStatusChanged: {
            switch(status){
            case Image.Ready:
                imageContainer.width = imageObj.paintedWidth;
                imageContainer.height = imageObj.paintedHeight;
                break;
            }
        }
    }

    Crop {
        id: imageCrop;
        anchors.fill: parent;
        cropArea.border.color: cropBorderColor;
        onCropAreaChanged:{
            cropRect = imageCrop.getCropRect();
        }
    }
}
