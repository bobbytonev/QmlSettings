import QtQuick 2.0
import QtQuick.Controls 2.2

Popup{
id:popup
width:parent.width
height:parent.height


property var themeList:[]

onVisibleChanged: {

if(visible){
	themeList=tcm.themeNames();
	themeList=themeList;
	}
	
}
MouseArea{
       
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {
		
          popup.close();
        }
    }
	
	ListView{
    id:view
	anchors.fill:parent
    clip: true
    model:themeList.length 
	delegate:Button{
		text:themeList[index];
		highlighted:tcm.getThemeName() == themeList[index];
		width:view.width
		height:window.mediumSize
		onClicked:{
		
			//window.close();
			popup.close();
		}
	}
	
	
   }


}