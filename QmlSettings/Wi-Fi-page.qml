import QtQuick 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15


Item {
  



    ListView {
        id: listView1
        clip:true
        anchors.fill: parent
      header:  ColumnLayout {
          id: columnLayout
          width: parent.width

         // Layout.fillHeight: true
         // Layout.fillWidth: true
          Rectangle{
              color: "#00000000"
              border.color: "#00000000"
              Layout.preferredHeight: 6
              Layout.fillWidth: true

          }

      Switch {
                  id: switch1
                  text: "Use Wi-Fi"
                  //font.pixelSize: 14

                  Layout.preferredHeight: window.mediumSize
                  Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                 // Layout.fillHeight: true
                  Layout.fillWidth: true
              }




                  CheckBox{
                      width: switch1.width
                      Layout.preferredWidth: 64
                      tristate: false
                     // font.pixelSize: 14
                      text:"Connect to Wi-Fi network automatically"
                      checkState: Qt.Unchecked
                      //Layout.fillHeight: true
                      Layout.fillWidth: true
Layout.preferredHeight: window.mediumSize




                  }


                  MenuSeparator {
                      id: rectangle
                      width: parent.width
                visible: listView1.count>0
                      Layout.fillWidth: true
                  }

      }

footer:ItemDelegate{
    width: listView1.width

   Column{

        width: parent.width
height: parent.height
MenuSeparator{
 width: parent.width
 }
        Button{
              id:savedNetworks
              text:"Saved networks"
              //Layout.preferredHeight: window.mediumSize
              height: window.mediumSize
             width: parent.width

               // font.pixelSize: 14


          }
        Label{
            id:mac
            text:"Mac address:"+macAddress
            height: window.mediumSize
           width: parent.width



             // font.pixelSize: 14

        }
    }


}


    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
