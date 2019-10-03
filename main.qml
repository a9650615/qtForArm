import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Scene3D 2.0
import QtMultimedia 5.5

import Qt3D.Core 2.0
import Qt3D.Render 2.0
//import Qt3D.Input 2.0
//import Qt3D.Extras 2.0

// custom element

import io.qt.colormarker 1.0

ApplicationWindow
{
    id: applicationWindow
    visible: true
    width: 1280
    height: 720
    title: qsTr("Hello window")

    ColorMarker {
        id: colorMarker
    }

//    Text {
//        id: element
//        text: qsTr(colorMarker.appName)
//        font.pixelSize: 12
//        z: 10
//    }



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
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                width: parent.width / 2
//                Camera {
//                    id: camera
//                }

                VideoOutput {
                    source: colorMarker
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        left: parent.left
                        right: parent.right
                    }

//                    anchors.fill: parent
                    focus : visible // to receive focus and capture key events when visible
//                    autoOrientation : false
                }
//                onPaint: {
//                    var ctx = getContext('2d');
//                    ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
//                    ctx.fillRect(0, 0, width, height);
//                }
            }

            Item {
                id: viewfor3d
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: cameraView.right
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                Scene3D {
                    anchors.fill: parent
//                    anchors {
//                        right: parent.right
//                        top: parent.top
//                        bottom: parent.bottom
//                        left: cameraView.left
//                    }
                    Model {
                    }
                }
            }

//            Canvas {
//                id: cameraView2
//                anchors.right: parent.right
//                anchors.rightMargin: 0
//                anchors.left: parent.left
//                anchors.leftMargin: parent.width / 2
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: 0
//                anchors.top: parent.top
//                anchors.topMargin: 0
//                onPaint: {
//                    var ctx = getContext('2d');
//                    ctx.fillStyle = Qt.rgba(0, 1, 0, 1);
//                    ctx.fillRect(0, 0, width, height);
//                }
//            }


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


//    Rectangle {
//           id: scene
//           anchors.fill: parent
//           anchors.margins: 50
////           color: "darkRed"

//           transform: Rotation {
//               id: sceneRotation
//               axis.x: 1
//               axis.y: 0
//               axis.z: 0
//               origin.x: scene.width / 2
//               origin.y: scene.height / 2
//           }

//           Scene3D {
//               anchors {
//                   right: parent.right
//                   top: parent.top
//                   bottom: parent.bottom
//               }
//               width: parent.width
//               Model {
//               }
//           }
////           Model {}
////           Scene3D {
////               id: scene3d
////               anchors.fill: parent
////               anchors.margins: 10
////               focus: true
////               aspects: ["input", "logic"]
////               cameraAspectRatioMode: Scene3D.AutomaticAspectRatio


//////               AnimatedEntity {}
////           }
//       }
}



/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:1;anchors_y:0}D{i:3;anchors_height:0;anchors_width:0}
}
##^##*/
