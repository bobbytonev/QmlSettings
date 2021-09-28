import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11


Item {
    id: item1
    height: window.mediumSize
    property alias imageSource: image.source
    property alias textSource: roundButtons.text
    signal clicked();

    Row {
        id: row
        anchors.fill: parent

        Item {
            id: item2
            width: window.mediumSize
            height: window.mediumSize

            Button {
                id: roundButtons
                text:roundButtons.text1Text
                width: window.mediumSize
                height: window.mediumSize
                Image{
                    id:image
                    x:roundButtons.width/2-width/2
                    y:roundButtons.height/2-height/2-10

                    width: roundButtons.width/2
                    height: width
                 }
                onClicked: {
				slider.value=0
                    item1.clicked()
                }
            }

        }

        Item {
            id: item3
            width: parent.width-(item2.width+row.spacing)
            height: parent.height

            Slider {
                anchors.fill: parent
				id:slider;
                //anchors.bottomMargin: 0
                anchors.topMargin:-roundButtons.height/2-1
                anchors.rightMargin: 50
               anchors.leftMargin: 50
                    value: 0.5



            }
        }
    }

}
