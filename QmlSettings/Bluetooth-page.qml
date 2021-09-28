import QtQuick 2.12

import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15


Item {
    property var buttonNames : ["New Device","Previous connected devices"]
    property var imagesNames : ["pair.png","previous.png"]
  Column{
      width: parent.width
      Repeater{
          model:buttonNames.length
          Button{
              id:pair
              width: parent.width
              text:buttonNames[index];
              //Image{
                 icon.source:"images/"+imagesNames[index]
                  //id:image
                  //width: 32
                  //height: width
                 // x:16
                 // y:pair.height/2-height/2

              //}
              height: 74

          //leftPadding:18+image.width

          }
      }
      MenuSeparator{
          width: parent.width


      }

      Label{
          text:"Device name:Unknown"

          height: window.mediumSize
          width: parent.width
      }




  }




}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
