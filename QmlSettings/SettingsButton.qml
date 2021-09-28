import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: item1

    signal clicked();
    property alias settingsText: text1.text
     property alias textFontSize: text1.font.pixelSize

    Rectangle{
       width: parent.width
       height: 1
       y:text1.height-1
        color:"transparent"
        border.color:"#0080c0"

    }

    Text {
        id: text1
        color: "white"
        text: qsTr("Text")
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 16
    }
    MouseArea{
        id:mouse
        anchors.fill: parent
        onClicked: {
            item1.clicked()
        }
    }

}
