import QtQuick 6.5
import QtQuick.Controls 6.5
import QtQuick.Layouts 1.15     //布局模块
import QtQuick.Effects
import Qt5Compat.GraphicalEffects


// Text {
//     text: "这是第一页"
//     anchors.centerIn: parent
// }

// Button {
//     text: "转到第二页"
//     anchors.centerIn: parent

//     onClicked: {
//         // parent is inside StackView, so we can call stack.push() to navigate
//         stack.push(Qt.resolvedUrl("SecondPage.qml"))
//     }
// }

Item {
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id: systemRect
            Layout.fillWidth: true
            height: 50
            color: "white"
            // border.color: "blue"

            Button {
                id: systemLogo
                x: 30
                y: 10
                width: 36
                height: 36

                Image {
                    width: 36
                    height: 37
                    source: "/images/logo.png"
                    anchors.fill: parent
                }
            }

            Button {
                id:systemTitle
                x: 66
                y:10
                height: 36
                text: "迅界解压缩大师"
            }

            Button {
                id: systemUser
                x: parent.width - 400
                y: 10
                width: 32
                height: 32
            }

            Button {
                id: systemVip
                x: parent.width - 361
                y: 10
                width: 100
                height: 32
            }

            Button {
                id: systemServise
                x: parent.width - 204
                y: 15
                width: 20
                height: 20
            }

            Button {
                id: systemSetting
                x: parent.width - 164
                y: 15
                width: 20
                height: 20
            }

            Button {
                id: systemMin
                x: parent.width - 124
                y: 15
                width: 20
                height: 20

                onClicked: {
                    root.visibility = Window.Minimized
                }
            }

            Button {
                id: systemMax
                x: parent.width - 84
                y: 15
                width: 20
                height: 20

                onClicked: {
                    if(root.visibility === Window.FullScreen)
                    {
                        root.visibility = Window.Windowed
                    }else
                    {
                        root.visibility = Window.FullScreen
                    }
                }
            }

            Button {
                id: systemClose
                x: parent.width - 44
                y: 15
                width: 20
                height: 20

                onClicked: {
                    close()
                }
            }
        }

        Rectangle {
            id: bodyRect
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#F4F8FF"
            // border.color: "red"

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                RowLayout {
                    id: bodybigrect
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * (240 / 550)
                    spacing: 20
                    Layout.margins: 32

                    Rectangle {
                        id: bodyZip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        // border.color: "red"
                        radius: 18
                        Image {
                            id: bodyZipBtPic
                            source: "/images/zipbt.png"
                            anchors.fill: bodyZip
                        }

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                bodyZip.y = bodyZip.y - 3
                            }

                            onExited: {
                                bodyZip.y = bodyZip.y + 3;
                            }

                        }


                        //添加动画（当y属性发生变化的时候，调用这个动画）
                        Behavior on y {
                            //专门用来给数值属性（比如x，y，width，height，opacity等）做平滑过渡
                            NumberAnimation {
                                //动画时长
                                duration: 100;
                                //easing是缓动曲线控制器，决定动画的手感，InOutQuad表示过程是：慢->快->慢
                                easing.type: Easing.InOutQuad
                            }
                        }

                    }

                    Rectangle {
                        id: bodyUnzip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        // border.color: "red"
                        radius: 18
                        Image {
                            id: bodyUnzipBtPic
                            source: "/images/unzipbt.png"
                            anchors.fill: parent
                        }
                    }
                }


                DropShadow {
                    anchors.fill: bodyZip                  // 阴影跟随矩形大小
                    source: bodyZip                        // 阴影来源对象
                    color: "#50000000"                      // 阴影颜色（半透明黑）
                    horizontalOffset: 0                     // X 偏移
                    verticalOffset: 5                       // Y 偏移
                    radius: 10                              // 模糊半径
                    samples: 16                             // 阴影采样数量，值越高越平滑
                    transparentBorder: true                 // 阴影透明边界
                    visible: mouseArea.containsMouse        //只有hover的时候才会显示

                    Behavior on visible {
                        NumberAnimation {
                            duration: 200;
                            easing.type: Easing.InOutQuad
                        }
                    }
                }

                RowLayout {
                    id: bodysmallRect
                    x: 34
                    y: bodybigrect.y + bodybigrect.height + ((32 / 550) * parent.height)
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * (180 / 550)
                    spacing: 16
                    Layout.margins: 32

                    Rectangle {
                        id: bodyPiczip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        border.color: "red"
                    }

                    Rectangle {
                        id: bodyVideozip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        border.color: "red"
                    }

                    Rectangle {
                        id: bodyPdfzip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        border.color: "red"
                    }

                    Rectangle {
                        id: bodyWordzip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        border.color: "red"
                    }

                    Rectangle {
                        id: bodyPPTzip
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredWidth: 1     // 设置比例 1
                        border.color: "red"
                    }

                    Rectangle {
                        id: bodyFileManagement
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1   // 保证等分
                        border.color: "red"
                    }
                }
            }
        }


    }
}


