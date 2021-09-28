import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15


ApplicationWindow {
    id: window
    width: 1024
	y:30
    height: 520
    visible: true
   
    property alias settingsText:  headerText.text

    property alias stackView: stackView
	
	property var mediumSize: height/8
	property var largeSize: height/4.7


//onActiveChanged: {
   // if (!active) {
    //console.log("ActiveChange");
    //}
//}

 


//flags:Qt.FramelessWindowHint


    //property var backgroundColor:msg.colors[0]=== null  ? "black":msg.colors[0]

    property var foregroundColor:msg.colors[1]=== null ? "#0080c0":msg.colors[1]

property var pageName:[]




header:Column{
    height: 64
     width: window.width
    Label{
      id:headerText
        text:stackView.currentItem.objectName//pageName[pageName.length-1]//"Settings"
        height: parent.height-1
		font.pixelSize: 17
        width: window.width
    }
    Rectangle{
        width: window.width
        //enabled: false
        height: 1
        color: foregroundColor
    }
}

//header: SettingsButton{
    //id: settingsButton
        // settingsText: "Settings"
        // height: 64
         //textFontSize: 17
         //width: listView.width
     //}

    StackView {
        id: stackView
        anchors.fill: parent



    }


    Component.onCompleted: {
		

	var list=launcher.getEnvSettings();
		if(list.length>0){
		stackView.push(launcher.getEnvSettings()[0]);
		window.stackView.currentItem.objectName=launcher.getEnvSettings()[0].replace("-page.qml","");
		}else{
        stackView.push("main-page.qml");
        stackView.currentItem.objectName="Settings";
		}


    }
    MouseArea{
        id:mouse
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {

           if(stackView.children.length>1) {
               stackView.pop();
               pageName.pop();
           }else{
               //Qt.quit();
			   Qt.callLater(Qt.quit)
			 // window.visible=false

           }
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
