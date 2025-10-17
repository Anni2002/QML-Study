import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Item {
    id: root

    //公共属性
    property Item blurSource        //源背景图
    property real blurAmount: 1     //不透明度
    property bool dragable: false   //是否可拖动

    property real blurMax: 64
    property real borderRadius: 24
    property color borderColor: "transparent"
    property real borderWidth: 0

    default property alias content: contentItem.data        //插槽组件


    width: 300
    height: 200

    //=== 拖拽功能 ===
    MouseArea {
        anchors.fill: parent
        drag.target: root               //拖拽整个控件
        drag.axis: Drag.XAndYAxis       //拖拽位移
        enabled: root.dragable          //外部控制是否可以拖拽
    }

    // === 捕获背景内容 ===
    ShaderEffectSource {
        id: effectSource
        anchors.fill: parent
        sourceItem: root.blurSource     //从指定源获取背景
        sourceRect: Qt.rect(root.x, root.y, root.width, root.height)        //获取对应区域
        visible: false
    }


    // === 创建遮罩 ===
    Item {
        id: maskItem
        anchors.fill: parent
        layer.enabled: true
        layer.smooth: true
        visible: false

        Rectangle {
            anchors.fill: parent
            radius: root.borderRadius
            color: "white"                  //不能实透明色，否则遮罩无效
        }
    }

    // === 启用遮罩 ===
    MultiEffect {
        anchors.fill: effectSource
        source: effectSource
        autoPaddingEnabled: false
        blurEnabled: true
        blurMax: root.blurMax
        blur: root.blurAmount
        maskEnabled: true
        maskSource: maskItem
    }

    Rectangle {
        anchors.fill: parent
        radius: root.borderRadius
        color: "#4EFFFFFF"
        z: 1
        opacity: 1.0
        border.color: root.borderColor
        border.width: root.borderWidth
    }

    Rectangle {
        id: contentItem
        anchors.fill: parent
        clip: true
        z: 2
        color: "transparent"
    }
}







