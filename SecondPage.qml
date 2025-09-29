import QtQuick 6.8
import QtQuick.Window 6.8
import QtQuick.Effects 6.8

Rectangle {
    width: 800
    height: 400
    color: "#f0f2f5"

    Row {
        anchors.centerIn: parent
        spacing: 40

        // 左侧矩形 - 带悬停动画效果
        Rectangle {
            id: leftRect
            width: 350
            height: 380
            color: "#ffffff"
            radius: 12
            border.color: "#e1e5e9"
            border.width: 1

            // 颜色动画
            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            // 边框颜色动画
            Behavior on border.color {
                ColorAnimation { duration: 200 }
            }

            // Y轴位置动画
            Behavior on y {
                NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
            }

            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: "#40000000"
                shadowVerticalOffset: 8
                shadowBlur: 0.3
                shadowScale: 1.05
            }

            // 悬停效果
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    leftRect.color = "#f8f9fa"
                    leftRect.border.color = "#4dabf7"
                    leftRect.y = -10
                }
                onExited: {
                    leftRect.color = "#ffffff"
                    leftRect.border.color = "#e1e5e9"
                    leftRect.y = 0
                    leftRect.layer.effect.shadowBlur = 0.3
                    leftRect.layer.effect.shadowVerticalOffset = 8
                }
            }
        }
    }
}
