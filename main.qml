import QtQuick 2.0
import QtQuick.Controls 1.0
//import QtQuick.Scene3D 2.0
import QtMultimedia 5.5

//import Qt3D.Core 2.0
//import Qt3D.Render 2.0
//import Qt3D.Input 2.0
//import Qt3D.Extras 2.0

// custom element

import io.qt.colormarker 1.0

ApplicationWindow
{
    id: applicationWindow
    visible: true
    width: 720
    height: 480
    title: qsTr("Hello window")

    ColorMarker {
        id: colorMarker
    }

    Text {
        id: element
        text: qsTr(colorMarker.appName)
        font.pixelSize: 12
        z: 10
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Column {
            spacing: 1
            anchors.fill: parent

            Item {
                id: cameraView
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                Camera {
                    id: camera
//                    captureMode: Camera.
//                    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

//                    exposure {
//                        exposureCompensation: -1.0
//                        exposureMode: Camera.ExposurePortrait
//                    }

//                    flash.mode: Camera.FlashRedEyeReduction

//                    imageCapture {
//                        onImageCaptured: {
//                            photoPreview.source = preview  // Show the preview in an Image
//                        }
//                    }
                }

                VideoOutput {
                    source: camera
                    anchors.fill: parent
                    focus : visible // to receive focus and capture key events when visible
//                    autoOrientation : false
                }
//                onPaint: {
//                    var ctx = getContext('2d');
//                    ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
//                    ctx.fillRect(0, 0, width, height);
//                }
            }

            Canvas {
                id: cameraView2
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                onPaint: {
                    var ctx = getContext('2d');
                    ctx.fillStyle = Qt.rgba(0, 1, 0, 1);
                    ctx.fillRect(0, 0, width, height);
                }
            }

//            Scene3D {
//                anchors.fill: parent
//                aspects: ["render", "logic", "input"]
//            }

//            Scene3D {
//                aspects: ["input", "logic"]
//                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
            //            }
        }
    }


}



/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:1;anchors_y:0}D{i:3;anchors_height:0;anchors_width:0}
}
##^##*/
