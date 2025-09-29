import QtQuick 2.15             //基础可视元素、布局容器和事件响应
import QtQuick.Controls 2.15    //
import QtQuick.Layouts 1.15     //布局模块
import QtQuick.Controls.Material


//根对象
ApplicationWindow {
    id: root
    minimumWidth: 1000
    minimumHeight: 600
    visible: true
    // title: qsTr("Hello World")

    StackView{
        id: stack
        anchors.fill: parent //fil the entire window
        //initialItem: specifies the first page to display
        initialItem: MyDropShadow {} //文件名第一个字母最好大写，否则可能报错
    }
}
