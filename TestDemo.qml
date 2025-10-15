import QtQuick 6.8              //基础可视元素、布局容器和事件响应
import QtQuick.Controls 6.8    //
import QtQuick.Layouts 6.8     //布局模块
import QtQuick.Controls.Material
import QtQuick.Effects
import Qt.labs.folderlistmodel 2.1


Item {
    // id: root

    Theme {
        id:theme
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: {
            // Qt.inputMethod.hide()   //关闭软键盘
            focus = false
        }
    }

    // 辅助函数：将字节数转换为可读格式
    function humanReadableSize(bytes) {
        if (bytes < 1024) return bytes + " B"
        else if (bytes < 1024*1024) return (bytes/1024).toFixed(1) + " KB"
        else if (bytes < 1024*1024*1024) return (bytes/1024/1024).toFixed(1) + " MB"
        else return (bytes/1024/1024/1024).toFixed(1) + " GB"
    }

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
        color: "#262626"

        //设置圆角
        radius: 0
        topLeftRadius: 20
        bottomLeftRadius: 20
        clip: true

        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 1
            color: "#454545"
        }

        Label {
            id: logo
            width: 30
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            y: 10

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

                onEntered: parent.color = "#DD999999"
                onExited: parent.color = "transparent"

            }
        }

        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
        }

    }

    Rectangle {
        id: bodyWindow
        width: parent.width - systemWindow.width
        height: parent.height
        x: systemWindow.width
        y: 0
        // color: "white"
        color: "#212121"

        radius: 0
        topRightRadius: 20
        bottomRightRadius: 20


        Rectangle {
            id: bodyTop
            x: 0
            y: 0
            width: root.width - systemWindow.width
            height: 50
            // color: "black"
            color: "#212121"

            topRightRadius: 20

            RowLayout {
                id: topLayout
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                Label {
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 30
                    Layout.alignment: Qt.AlignVCenter

                    background: Image {
                        source: "/images/toplogo.png"
                        anchors.fill: parent
                    }
                }

                Label {
                    text: "Folders"
                    font.pixelSize: 15
                    // color: "#515151"
                    color: "white"
                    Layout.alignment: Qt.AlignCenter

                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    id: topSearch
                    width: 180
                    height: 30
                    // anchors.verticalCenter: parent.verticalCenter   //垂直居中
                    Layout.alignment: Qt.AlignVCenter
                    radius: 4


                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 5

                        // Label {
                        //     id: topsearchLogo
                        //     width: 10
                        //     height: 10
                        //     background: Image {
                        //         id: searchlogoimg
                        //         source: "/images/searchlogo.png"
                        //         anchors.fill: parent
                        //     }
                        // }

                        Image {
                            id: topsearchLogo
                            source: "/images/searchlogo.png"
                            Layout.preferredWidth: 15
                            Layout.preferredHeight: 15
                            Layout.alignment: Qt.AlignCenter
                            smooth: true
                        }

                        TextField {
                            id: topField
                            // placeholderText: "Search"
                            text: "Search"
                            color: "black"
                            background: null
                            // anchors.verticalCenter: parent.verticalCenter
                            width: parent.width - topsearchLogo.width - 15
                            Layout.alignment: Qt.AlignVCenter

                            onActiveFocusChanged: {
                                if(activeFocus && text === "Search")
                                {
                                    text = "";
                                }else if(!activeFocus && text === "")
                                {
                                    text = "Search";
                                }
                            }

                        }
                    }
                }

                Button {
                    id: userHead
                    Layout.preferredHeight: 16
                    Layout.preferredWidth: 16
                    background: null

                    contentItem: Image{
                        anchors.fill: parent
                        source: userHead.hovered ? "/images/head_h.png" : "/images/head_n.png"
                        fillMode: Image.PreserveAspectFit
                        smooth: true
                        antialiasing: true

                        // sourceSize.width: width * 2
                        // sourceSize.height: height * 2
                    }
                }

                Button {
                    id: closeBt
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
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
                        // sourceSize.width: width * 2
                        // sourceSize.height: height * 2
                    }

                    onClicked: {
                        Qt.quit();
                    }
                }


            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: 1
                color: "#454545"
            }
        }


        Rectangle {
            id: bodyBottom
            x: bodyTop.x
            y: bodyTop.height
            width: parent.width
            height: parent.height - bodyTop.height
            color: "transparent"

            Rectangle {
                id: bodyLeft
                x: 0
                y: 0
                width: 740
                height: parent.height
                color: "transparent"

                Rectangle {
                    id: leftTop
                    x: 0
                    y: 0
                    width: parent.width
                    height: bodyTop.height
                    color: "transparent"
                    // color: "red"

                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 1
                        color: "#454545"
                    }

                }

                Rectangle {
                    id: bodyList
                    x: leftTop.x
                    y: leftTop.height
                    width: parent.width
                    height: parent.height - leftTop.height
                    color: "transparent"

                    FolderListModel {
                        id: folderModel
                        // folder: "file:///D:/Work"
                        folder: "file:///D:/code"

                        showDirs: true          //显示文件夹
                        showFiles: true         //显示文件
                        showDotAndDotDot: true  //显示文件日期
                        nameFilters: ["*"]      //过滤文件类型

                        // folderFirst: true
                        sortField: FolderListModel.Name
                    }



                    ListView {
                        id: fileList
                        anchors.fill: parent
                        model: folderModel
                        clip: true

                        delegate: Rectangle{
                            width: bodyList.width
                            height: 40
                            color: "transparent"

                            Rectangle {
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                height: 1
                                color: "#454545"
                            }

                            RowLayout {
                                id: listLayout
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 10

                                Image {
                                    id: listImg
                                    Layout.preferredHeight: 20
                                    Layout.preferredWidth: 20
                                    Layout.alignment: Qt.AlignVCenter
                                    source: fileIsDir ? "/images/dirlogo.png" : "/images/filelogo.png"
                                    smooth: true
                                    // fillMode: Image.PreserveAspectFit
                                    antialiasing: true

                                    // sourceSize.width: width * 2
                                    // sourceSize.height: height * 2
                                }

                                Text {
                                    // id: fileName
                                    text: model.fileName
                                    color: "white"
                                    elide: Text.ElideRight
                                    // width: parent.width - 80
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                }

                                Text {
                                    // id: fileDate
                                    // text: Qt.formatDateTime(fileModified,"yyyy-MM-dd HH:mm:ss")  //修改时间格式
                                    text: Qt.formatDateTime(fileModified,"yyyy-MM-dd")
                                    color: "white"
                                    // elide: Text.ElideRight
                                    horizontalAlignment: Text.AlignRight

                                }

                                Text {
                                    text: fileIsDir ? "" : humanReadableSize(fileSize)
                                    horizontalAlignment: Text.AlignRight
                                    width: 100
                                    color: "white"

                                }

                                Button {
                                    Layout.preferredWidth: 20
                                    Layout.preferredHeight: 20
                                    Layout.alignment: Qt.AlignCenter
                                    width: 20
                                    height: 20
                                    background: null

                                    contentItem: Image {
                                        source: "/images/listset.png"
                                        anchors.fill: parent
                                        smooth: true
                                        antialiasing: true

                                        // sourceSize.width: width * 2
                                        // sourceSize.height: height * 2

                                    }
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: ListView.currentIndex = index
                                onDoubleClicked: {
                                    if(fileIsDir)
                                    {
                                        folderModel.folder = fileUrl
                                    }
                                }


                            }
                        }
                    }

                    Component.onCompleted: {
                        console.log("当前路径:", folderModel.folder)
                        console.log("文件数:", folderModel.count)
                    }

                }

                Rectangle {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 1
                    color: "#454545"
                }


            }

            Rectangle {
                id: bodyRight
                x: bodyLeft.width
                y: 0
                width: parent.width - bodyLeft.width
                height: parent.height
                color: "transparent"

            }
        }


    }
}
