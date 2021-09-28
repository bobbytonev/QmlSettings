import QtQuick 2.0
import QtQuick.Controls 2.0
Item {
 width: 1024
      property var buttonNames : ["Date and clock","About"]


ListView{
    id:view
    clip:true
    anchors.fill: parent
    model:buttonNames.length
    delegate:  Button{
        id:pair
        width: parent.width
        text:buttonNames[index];
        height: window.mediumSize
        onClicked: {
            window.stackView.push(text+"-page.qml");
            //window.settingsText=text
              window.stackView.currentItem.objectName=text;
        }
    }

}


}
