import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
Item{


 property var settingsNames: ["Wi-Fi","Bluetooth","Appearance","Apps","Sound","Storage","System"]


NumberAnimation{
id:animation
target: grid
to:1
from:0
property:"opacity"
duration: 1000

}
Component.onCompleted: {
animation.start()
}



    Flow {

        id: grid
        opacity: 1

       anchors.fill: parent
        //spacing: 40

        Repeater{
            id:rep
            model:settingsNames.length
            Button{
                id:control
                     text: settingsNames[index];
                width: parent.width/3
                height: window.largeSize
                onClicked: {
                    window.stackView.push(text+"-page.qml");
                    window.stackView.currentItem.objectName=text;


                }
                //Image{
                //    id:image
                    //source: "images/"+control.text+".png"
					icon.source:"images/"+control.text+".png"
                    // width:control.height/2.7
                    // height: width
                    // x:16
                    // y:control.height/2-height/2

               // }
                //leftPadding: 18+image.width



        }
    }
}
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
