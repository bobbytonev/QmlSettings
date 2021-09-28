import QtQuick 2.10

Item {
    width: 64
    id:root
    height: 64
    property alias rectangleY: rectangle.y
    property alias imageY: image.y
    property alias imageSource: image.source
    property alias text1Text: text1.text



    signal clicked();

    property bool isReverse: true


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        antialiasing: true
        onClicked: {
            root.clicked()

        }
        onPressed: {
            pressAnimation.stop()
            pressAnimation.from=0
            pressAnimation.to=0.3
            pressAnimation.start()

        }
        onReleased: {
            pressAnimation.stop()
            pressAnimation.from=0.3
            pressAnimation.to=0
            pressAnimation.start()

        }

    }

    Column {
        id: column
        anchors.fill: parent
        spacing: 5

        Image {
            id: image
            x: parent.width/2-image.width/2
            y: parent.height/2-image.height/2
            width: parent.width/2
            height: width
            source: ""
            mipmap: true
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: rectangle
            y: image.height+image.y
            width: parent.width
            height: 1
            color: "#0080c0"
        }

        Text {
            id: text1
            x: rectangle.radius/2
            y: parent.height-image.height
            width: parent.width-(rectangle.radius)
            height: 20
            color: "#ffffff"
            text: qsTr("System")
            elide: Text.ElideRight
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

    }
    NumberAnimation{
        id:pressAnimation
        target:rect
        property:"opacity"
        duration: 100
    }

    Rectangle {
        id: rect
        x: parent.width/2-width/2
        y: 0
        width: parent.width
        height: image.height
        color: "#1d1d1d"
        radius: 0
        opacity:0

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
