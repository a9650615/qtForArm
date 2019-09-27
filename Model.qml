import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Extras 2.12

Entity {
    id: root

    property vector3d position: Qt.vector3d(0, 0, 0)
    property real angleX: 0
    property real angleY: 0
    property real angleZ: 0
    property real scale: 1

    components: [
//        Transform {
//            translation: root.position
//            rotation: fromEulerAngles(root.angleX, root.angleY, root.angleZ)
//            scale: root.scale
//        },
        SceneLoader {
            source: "qrc:/assets/scene.gltf"
        }
    ]
}
