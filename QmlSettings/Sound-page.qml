import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import Qt.labs.settings 1.1
import QtQuick.Controls.Material 2.12
import "."
Item {
  //  width:parent.width
    //height: parent.height
    property var imagesName:["settings-call-volume","settings-in-call-volume","settings-media-volume"]
     property var names:["Call","In-call","Media"]

    ListView {
        id: listView
        anchors.fill: parent
        anchors.topMargin: 64



spacing:20
        model:3
       // delegate: //SoundSlider{
               // width: listView.width
                //height: window.largeSize
                //imageSource: "images/sound-page/"+imagesName[index]
                //textSource: names[index]
                //onClicked: {


                //}



        //}
		delegate:RowLayout{
			width:listView.width
			Button{
				icon.source:"images/sound-page/"+imagesName[index]
				display:Button.TextUnderIcon
				text:names[index];
			}
			Slider{
				height: window.mediumSize
				Layout.fillWidth :true
				 value: 0.5
			}
		
		}




        }





}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.33;height:480;width:640}
}
##^##*/
