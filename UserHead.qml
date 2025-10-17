import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Item {
    id: root
    width: 80
    height: 80

    property url headimg: "/images/userhead.jpg"

    MultiEffect {
        id: maskRec
        source: headimg
        anchors.fill: parent
    }
}
