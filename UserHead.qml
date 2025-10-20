import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Item {
    id: root
    width: 80
    height: 80

    property url headimg: "/images/userhead.jpg"

    Image {
        id: sourceImg
        source: root.headimg
        anchors.centerIn: parent
        // smooth: true
        width: root.width
        height: root.height
        fillMode: Image.PreserveAspectCrop
        visible: false
    }





    Item {
        id:maskRect
        width: sourceImg.width
        height: sourceImg.height
        layer.enabled: true
        visible: false

        Rectangle {
            anchors.fill: parent
            radius: width / 2
            color: "black"
        }
    }

    MultiEffect {
        id: multiEffect
        source: sourceImg
        anchors.fill: parent
        maskEnabled: true
        maskSource: maskRect
    }


}

// Item {
//     id: root
//     width: 80
//     height: 80

//     property url avatarSource: "qrc:/new/prefix1/fonts/pic/avatar.png"

//     // 原始图像，隐藏
//     Image {
//         id: sourceItem
//         source: root.avatarSource
//         anchors.centerIn: parent
//         width: root.width
//         height: root.height
//         fillMode: Image.PreserveAspectCrop
//         visible: false
//     }

//     //
//     MultiEffect {
//         id: multiEffect
//         source: sourceItem
//         anchors.fill: sourceItem
//         maskEnabled: true
//         maskSource: mask
//     }

//     // 圆形黑色矩形（用于遮罩）
//     Item {
//         id: mask
//         width: sourceItem.width
//         height: sourceItem.height
//         layer.enabled: true
//         visible: false

//         Rectangle {
//             anchors.fill: parent
//             radius: width / 2
//             color: "black" // 黑色用于掩码：纯黑表示完全不透明
//         }
//     }
// }
