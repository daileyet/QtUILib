import QtQuick 2.0

CropForm {
    id:root;
    property real mouseStartX;
    property real mouseStartY;
    property bool isChanging:false;
    property rect region: Qt.rect(root.x,root.y,root.width,root.height);
    property size minSize: Qt.size(10,10);
    /**
     * return cropper rectangle area
     */
    function getCropRect(){
        return Qt.rect(cropArea.x,cropArea.y,cropArea.width,cropArea.height);
    }

    //center drag move
    Connections{
        target: mouseAreaDrag
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var cropAreaNewX = cropArea.x + moveX, cropAreaNewY = cropArea.y + moveY;

            if(cropAreaNewX<region.x){
                cropAreaNewX = region.x;
            }
            if(cropAreaNewX+cropArea.width>region.x+region.width){
                cropAreaNewX = region.x+region.width - cropArea.width;
            }

            if(cropAreaNewY<region.y){
                cropAreaNewY = region.y;
            }
            if(cropAreaNewY+cropArea.height>region.y + region.height){
                cropAreaNewY = region.y + region.height - cropArea.height;
            }
            cropArea.x = cropAreaNewX;
            cropArea.y = cropAreaNewY;
        }

    }
    // top change hight
    Connections{
        target: mouseAreaTop
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var  cropAreaNewY = cropArea.y + moveY;
            var fixPoint = Qt.point(cropArea.x,cropArea.y+cropArea.height);
            if(cropAreaNewY<region.y){
                cropAreaNewY = region.y;
            }
            if(cropAreaNewY + minSize.height > fixPoint.y){
                cropAreaNewY = fixPoint.y - minSize.height;
            }
            cropArea.y = cropAreaNewY;
            cropArea.height = fixPoint.y - cropAreaNewY;
        }
    }
    //bottom change height
    Connections{
        target: mouseAreaButtom
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveY = mouse.y - mouseStartY;
            var  cropAreaNewH = cropArea.height + moveY;

            if(cropAreaNewH<minSize.height){
                cropAreaNewH = minSize.height;
            }
            if(cropAreaNewH + cropArea.y > region.height){
                cropAreaNewH = region.height - cropArea.y;
            }
            cropArea.height = cropAreaNewH;
        }
    }
    //left change width
    Connections{
        target: mouseAreaLeft
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX;
            var  cropAreaNewX = cropArea.x + moveX;
            var fixPoint = Qt.point(cropArea.x+cropArea.width,cropArea.y);
            if(cropAreaNewX<region.x){
                cropAreaNewX = region.x;
            }
            if(cropAreaNewX + minSize.width > fixPoint.x){
                cropAreaNewX = fixPoint.x - minSize.width;
            }
            cropArea.x = cropAreaNewX;
            cropArea.width = fixPoint.x - cropAreaNewX;
        }
    }
    //right change width
    Connections{
        target: mouseAreaRight
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX;
            var  cropAreaNewW = cropArea.width + moveX;

            if(cropAreaNewW<minSize.width){
                cropAreaNewW = minSize.width;
            }
            if(cropAreaNewW + cropArea.x > region.width){
                cropAreaNewW = region.width - cropArea.x;
            }
            cropArea.width = cropAreaNewW;
        }
    }

    Connections{
        target: mouseAreaLT;
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var fixPoint = Qt.point(cropArea.x+cropArea.width,cropArea.y+cropArea.height);
            var cropAreaNewX = cropArea.x + moveX, cropAreaNewY = cropArea.y + moveY;
            if(cropAreaNewX<region.x)
                cropAreaNewX = region.x;
            if(cropAreaNewY<region.y)
                cropAreaNewY = region.y;
            if(fixPoint.x - cropAreaNewX < minSize.width)
                cropAreaNewX = fixPoint.x - minSize.width;
            if(fixPoint.y - cropAreaNewY < minSize.height)
                cropAreaNewY = fixPoint.y - minSize.height;
            cropArea.x = cropAreaNewX;
            cropArea.y = cropAreaNewY;
            cropArea.width = fixPoint.x - cropAreaNewX;
            cropArea.height = fixPoint.y - cropAreaNewY;
        }
    }
    Connections{
        target: mouseAreaLB;
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var fixPoint = Qt.point(cropArea.x+cropArea.width,cropArea.y);
            //LB point
            var cropAreaNewX = cropArea.x + moveX, cropAreaNewY = cropArea.y + cropArea.height + moveY;
            if(cropAreaNewX<region.x)
                cropAreaNewX = region.x;
            if(cropAreaNewY<region.y)
                cropAreaNewY = region.y;
            if(cropAreaNewY>region.y+region.height)
                cropAreaNewY = region.y+region.height;
            if(fixPoint.x - cropAreaNewX < minSize.width)
                cropAreaNewX = fixPoint.x - minSize.width;
            if(cropAreaNewY - fixPoint.y < minSize.height)
                cropAreaNewY = fixPoint.y + minSize.height;
            cropArea.x = cropAreaNewX;
            cropArea.width = fixPoint.x - cropAreaNewX;
            cropArea.height = cropAreaNewY - fixPoint.y;
        }
    }
    Connections{
        target: mouseAreaRT;
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var fixPoint = Qt.point(cropArea.x,cropArea.y + cropArea.height);
            //RT point
            var cropAreaNewX = cropArea.x + cropArea.width + moveX, cropAreaNewY = cropArea.y + moveY;
            if(cropAreaNewX<region.x)
                cropAreaNewX = region.x;
            if(cropAreaNewX>region.x + region.width)
                cropAreaNewX = region.x + region.width;
            if(cropAreaNewY<region.y)
                cropAreaNewY = region.y;
            if(cropAreaNewY>region.y+region.height)
                cropAreaNewY = region.y+region.height;

            if(cropAreaNewX - fixPoint.x< minSize.width)
                cropAreaNewX = fixPoint.x + minSize.width;
            if(fixPoint.y -cropAreaNewY < minSize.height)
                cropAreaNewY = fixPoint.y - minSize.height;
            cropArea.y = cropAreaNewY;
            cropArea.width = cropAreaNewX - fixPoint.x;
            cropArea.height = fixPoint.y - cropAreaNewY;
        }
    }
    Connections{
        target: mouseAreaRB;
        onPressed:{
            mouseStartX = mouse.x;
            mouseStartY = mouse.y;
            isChanging=true;
        }
        onReleased:{
            isChanging=false;
        }
        onPositionChanged:{
            var moveX = mouse.x - mouseStartX, moveY = mouse.y - mouseStartY;
            var fixPoint = Qt.point(cropArea.x,cropArea.y);
            //RB point
            var cropAreaNewX = cropArea.x + cropArea.width + moveX, cropAreaNewY = cropArea.y + cropArea.height + moveY;
            if(cropAreaNewX>region.x+region.width)
                cropAreaNewX = region.x+region.width;
            if(cropAreaNewY>region.y+region.height)
                cropAreaNewY = region.y+region.height;
            if(cropAreaNewX - fixPoint.x  < minSize.width)
                cropAreaNewX = fixPoint.x + minSize.width;
            if(cropAreaNewY - fixPoint.y < minSize.height)
                cropAreaNewY = fixPoint.y + minSize.height;
            cropArea.width = cropAreaNewX - fixPoint.x;
            cropArea.height = cropAreaNewY - fixPoint.y;
        }
    }
}
