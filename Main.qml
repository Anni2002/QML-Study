import QtQuick 2.15             //基础可视元素、布局容器和事件响应
import QtQuick.Controls 2.15    //
import QtQuick.Layouts 1.15     //布局模块
import QtQuick.Controls.Material
// import "components" as Components        //这是找下一级目录的头文件
import Qt.labs.folderlistmodel
import Qt5Compat.GraphicalEffects




//根对象
ApplicationWindow {
    id: root
    minimumWidth: 1200
    minimumHeight: 800
    visible: true
    // title: qsTr("Hello World")
    // flags: Qt.FramelessWindowHint   //去掉标题栏和边框(任务栏的图标篇也会消失)
    flags: Qt.FramelessWindowHint | Qt.Window   //去掉标题栏和边框（任务栏图标正常显示）
    color: "transparent"

    Theme {
        id: theme
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: 35
        visible: false


    }

    Image {
        id: background
        source: "/images/01.jpg"
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    OpacityMask {
        anchors.fill: parent
        source: background
        maskSource: mask
    }





    // StackView{
    //     id: stack
    //     anchors.fill: parent //fil the entire window
    //     //initialItem: specifies the first page to display
    //     initialItem: TestDemo {} //文件名第一个字母最好大写，否则可能报错
    // }

    // FolderListModel {
    //         id: folderModel
    //         folder: "file:///D:/QTWork"   // 改成你自己的路径
    //         showDirs: true
    //         showFiles: true
    //         nameFilters: ["*"]  // 显示所有文件
    //     }

    //     ListView {
    //         anchors.fill: parent
    //         model: folderModel

    //         delegate: Rectangle {
    //             height: 30
    //             width: parent.width
    //             // color: index % 2 === 0 ? "#f0f0f0" : "#ffffff"

    //             Text {
    //                 anchors.verticalCenter: parent.verticalCenter
    //                 text: fileIsDir ? ("📁 " + fileName) : ("📄 " + fileName)
    //                 font.pixelSize: 16
    //                 elide: Text.ElideRight
    //             }
    //         }
    //     }

    //     Component.onCompleted: {
    //         console.log("当前路径:", folderModel.folder)
    //         console.log("文件数:", folderModel.count)
    //     }
}


// //定义圆角背景图
// Window {
//     width: 400
//     height: 300
//     visible: true
//     title: "Qt5Compat.GraphicalEffects - 圆角图片"
//     flags: Qt.FramelessWindowHint | Qt.Window   //去掉标题栏和边框（任务栏图标正常显示）
//     color: "transparent"

//     // 定义圆角蒙版
//     Rectangle {
//         id: mask
//         width: 200
//         height: 200
//         radius: 20
//         visible: false
//     }

//     // 原始图片
//     Image {
//         id: sourceImage
//         width: 200
//         height: 200
//         anchors.centerIn: parent
//         source: "/images/zipbt.png"
//         fillMode: Image.PreserveAspectCrop
//         visible: false
//     }

//     // 应用圆角蒙版
//     OpacityMask {
//         anchors.centerIn: parent
//         width: 200
//         height: 200
//         source: sourceImage
//         maskSource: mask
//     }
// }


