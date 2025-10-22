import QtQuick

Item {
    id: timeDisolay
    width: 100
    height: 100

    property var newdate: new Date()
    property int hourdata: newdate.getHours()
    property int minidata: newdate.getMinutes()
    property int mouthdata: newdate.getMonth()
    property int daydata: newdate.getDay()

    property int showdata: daydata


    Text {
        id: datetext
        text: showdata
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        color: "#e0853c"
    }

    Timer {
        interval: 1000          //1秒触发一次
        running: true           //启动定时器
        repeat: true            //循环触发
        onTriggered: {
            daydate = new Date()
        }
    }
}
