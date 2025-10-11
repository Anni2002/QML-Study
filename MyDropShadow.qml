import QtQuick 6.5
import QtQuick.Controls 6.5
import Qt5Compat.GraphicalEffects


Item {
    width: parent
    height: parent

    anchors.fill: parent

    Rectangle {
        id: testrect
        // anchors.fill: parent
        width: 100
        height: 100
        x: 100
        y: 100
        radius: 12
        color: "blue"
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                testrect.y = testrect.y - 3

            }

            onExited: {
                testrect.y = testrect.y + 3;
            }
        }

        //添加动画（当y属性发生变化的时候，调用这个动画）
        Behavior on y {
            //专门用来给数值属性（比如x，y，width，height，opacity等）做平滑过渡
            NumberAnimation {
                //动画时长
                duration: 400;
                //easing是缓动曲线控制器，决定动画的手感，InOutQuad表示过程是：慢->快->慢
                easing.type: Easing.InOutQuad
            }
        }
    }

    DropShadow {
        anchors.fill: testrect                  // 阴影跟随矩形大小
        source: testrect                        // 阴影来源对象
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
}
