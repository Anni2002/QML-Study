import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Rectangle {
    id: root

    property string text: "Button"
    property string iconimg: ""
    signal clicked

    color: "transparent"

    transform: Scale {
        id: m_scale

        // origin:
    }

    RowLayout {
        id: layout

        anchors.centerIn: parent
        spacing: 8

        Text {
            id: iconLabel

        }
    }

}
