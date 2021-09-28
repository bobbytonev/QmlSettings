import QtQuick 2.0

Item {
    id:root
    signal clicked();
    property alias propertyText: text1.text

    Text {
        id: text1

        color: "#ffffff"
        text: qsTr("")
        elide: Text.ElideRight
        anchors.fill: parent
        font.pixelSize: 13
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        anchors.leftMargin: 16

    }
    MouseArea{
    anchors.fill: parent
    onClicked: {
        root.clicked()
    }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
