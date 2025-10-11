import QtQuick 6.8              //基础可视元素、布局容器和事件响应
import QtQuick.Controls 2.15    //
import QtQuick.Layouts 1.15     //布局模块
import QtQuick.Controls.Material
import QtQuick.Effects

Item {
    // id: root

    Item {
        id: titleMove
        width: parent.width
        height: 50
        x: 0
        y: 0

        MouseArea {
            anchors.fill: parent
            property real startX
            property real stareY

            onPressed: (mouse) => {
                startX = mouse.x
                stareY = mouse.y
            }

            onPositionChanged: {
                if(mouse.buttons === Qt.LeftButton)
                {
                    root.x += mouse.x - startX
                    root.y += mouse.y - stareY
                }
            }
        }
    }

    Rectangle {
        id: systemWindow
        x: 0
        y: 0
        width: 60
        height: parent.height
        color: "#999999"

        //设置圆角
        radius: 0
        topLeftRadius: 20
        topRightRadius: 0
        bottomLeftRadius: 20
        bottomRightRadius: 0
        clip: true

        Label {
            id: logo
            width: 30
            height: 30
            x: (systemWindow.width - logo.width) / 2
            y: logo.x

            background: Image {
                id: logoimg
                anchors.fill: parent
                source: "/images/testlogo.png"
                fillMode: Image.PreserveAspectFit           //保持比例缩放
                smooth: true                                //开启双线性平滑
                antialiasing: true                          //开启抗锯齿渲染

                //放大采样，提高放大后清晰度
                sourceSize.width: width * 2
                sourceSize.height: height * 2
            }
        }

        Rectangle {
            id: homePage
            // x: logo.x
            anchors.horizontalCenter: parent.horizontalCenter
            y: logo.y + logo.height * 2
            width: 35
            height: 35
            radius: homePage.width / 2
            color: "transparent"

            // 背景毛玻璃层
            MultiEffect {
                id: blurEffect
                anchors.fill: parent
                source: parent
                blurEnabled: true
                blur: 0           // 默认不模糊
                brightness: 0.0
                saturation: 1.0
            }

            Button {
                width: 20
                height: 20
                anchors.centerIn: parent            //居中对齐
                background: null

                contentItem: Image {
                    id: homePageImg
                    source: "/images/homelogo.png"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit       //保持比例缩放
                    smooth: true                            //开启双线性平滑
                    antialiasing: true                      //开启抗锯齿渲染

                    //放大采样，提高放大后清晰度
                    sourceSize.width: width * 2
                    sourceSize.height: height * 2
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                // onEntered: parent.color = "#DD999999"
                // onExited: parent.color = "transparent"

                onEntered: blurEffect.blur = 30
                onExited: blurEffect.blur = 0

            }


        }



    }

    Rectangle {
        id: bodyWindow
        width: parent.width - systemWindow.width
        height: parent.height
        x: systemWindow.width
        y: 0
        color: "white"

        radius: 0
        topLeftRadius: 0
        topRightRadius: 20
        bottomLeftRadius: 0
        bottomRightRadius: 20

        Button {
            id: closeBt
            width: 16
            height: 16
            x: parent.width - 20 - closeBt.width
            y: 15
            background: null                            //去掉默认背景

            // //不要用image和background，有锯齿，需要用contentItem才不会有锯齿
            // background : Image {
            //     id: closeImg
            //     anchors.fill: parent
            //     source: "/images/closebt.png"
            //     fillMode: Image.PreserveAspectFit

            //     smooth: true
            //     antialiasing: true
            // }

            contentItem: Image {
                anchors.fill: parent
                source: closeBt.hovered ? "/images/closebt_h.png" : "/images/closebt_n.png"
                fillMode: Image.PreserveAspectFit       //保持比例缩放
                smooth: true                            //开启双线性平滑
                antialiasing: true                      //开启抗锯齿渲染

                //放大采样，提高放大后清晰度
                sourceSize.width: width * 2
                sourceSize.height: height * 2
            }

            onClicked: {
                close();
            }
        }


    }
}
