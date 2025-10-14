import QtQuick 2.15             //基础可视元素、布局容器和事件响应
import QtQuick.Controls 2.15    //
import QtQuick.Layouts 1.15     //布局模块
import QtQuick.Controls.Material
// import "components" as Components        //这是找下一级目录的头文件


//根对象
ApplicationWindow {
    id: root
    minimumWidth: 1000
    minimumHeight: 600
    visible: true
    // title: qsTr("Hello World")
    // flags: Qt.FramelessWindowHint   //去掉标题栏和边框(任务栏的图标篇也会消失)
    flags: Qt.FramelessWindowHint | Qt.Window   //去掉标题栏和边框（任务栏图标正常显示）
    color: "transparent"

    Theme {
        id: theme
    }

    StackView{
        id: stack
        anchors.fill: parent //fil the entire window
        //initialItem: specifies the first page to display
        initialItem: TestDemo {} //文件名第一个字母最好大写，否则可能报错
    }
}
