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
        id: dragArea
        width: parent.width
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            property real startX
            property real startY

            onPressed: function(mouse) {
                startX = mouse.x
                startY = mouse.y
            }

            onPositionChanged: {
                if(mouse.buttons === Qt.LeftButton)
                {
                    root.x += mouse.x - startX
                    root.y += mouse.y - startY
                }
            }

        }
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

    SequentialAnimation {
        id: minimizeAnim

        ParallelAnimation {
            // NumberAnimation { target: root; property: "scale"; to: 0.2; duration: 300; easing.type: Easing.InOutQuad }
            NumberAnimation { target: root; property: "opacity"; to: 0.0; duration: 300; easing.type: Easing.InOutQuad }
        }

        ScriptAction { script: root.showMinimized() }   // 动画完成后执行最小化
        ScriptAction {
            // 动画结束后恢复属性，防止再次显示时错位
            script: {
                root.scale = 1.0
                root.opacity = 1.0
            }
        }
    }

    BlurCard {
        id: sysrec
        width: 46
        height: 80
        borderRadius: 15
        x:parent.width - sysrec.width - 20
        y: 20
        layer.enabled: true
        borderColor: "#e6e6e6"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10


            Rectangle {
                id: closerect
                width: 26
                height: 26
                radius: 13
                color: "transparent"

                Image {
                    id: closeimg
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    // fillMode: Image.PreserveAspectFit       //保持比例缩放
                    smooth: true                            //开启双线性平滑
                    antialiasing: true                      //开启抗锯齿渲染
                    source: "/images/close.png"

                    transform: Rotation {
                        id: rotation
                        origin.x: minimg.width / 2          //旋转中心点x
                        origin.y: minimg.height / 2         //旋转中心点y
                        angle: 0                            //旋转角度（以度为单位），0表示不旋转
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: {
                            rotationAnim.from = rotation.angle
                            rotationAnim.to = rotation.angle + 180
                            closerect.color = "white"
                            rotationAnim.start()
                        }

                        onExited: {
                            rotationAnim.from = rotation.angle
                            rotationAnim.to = rotation.angle - 180
                            closerect.color = "transparent"
                            rotationAnim.start()
                        }

                        onClicked: {
                            close()
                        }
                    }

                    NumberAnimation {
                        id: rotationAnim
                        target: rotation
                        property: "angle"
                        duration: 400
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Rectangle {
                id: minrect
                width: 26
                height: 26
                radius: 13
                color: "transparent"


                Image {
                    id: minimg
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    smooth: true
                    source: "/images/minbt.png"



                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        minrect.color = "white"
                    }

                    onExited: {
                        minrect.color = "transparent"
                    }

                    onClicked: {
                        // root.showMinimized()
                        minimizeAnim.start()
                    }
                }

            }
        }

    }

    BlurCard {
        id: leftBlur
        width: 240
        height: parent.height
        blurSource: background
        borderRadius: 35
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        layer.enabled: true
    }


    UserHead {
        id: userHead
        anchors.top: parent.top
        anchors.horizontalCenter: leftBlur.horizontalCenter
        anchors.left: parent.left
        anchors.topMargin: 40
        anchors.leftMargin: userHead.width
        headimg: "/images/userhead.jpg"

        // Behavior on scale {
        //     NumberAnimation {
        //         duration: 200;
        //         easing.type: Easing.InOutQuad
        //     }
        // }

        MouseArea {
            anchors.fill: parent

            onPressed: {parent.scale = 0.95}

            onReleased: {parent.scale = 1}

            onCanceled: {parent.scale = 0.1}
        }
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


