import QtQuick 2.0
import QtQuick.Controls 2.2




Popup{
id:popup
width:parent.width
height:parent.height

property var searchModel:[]


function filter(text){
searchModel=[];
	for(var i=0;i<process.timeZone.length;i++){
		if(process.timeZone[i].includes(text))
			searchModel.push(process.timeZone[i]);
	}
searchModel=searchModel;

}

onVisibleChanged: {

if(visible)
	process.reloadTimeZones();
	
}


MouseArea{
       
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {
		
          popup.close();
        }
    }
	Column{
	anchors.fill:parent
	Row{
	id:row
	width:parent.width
	
		Rectangle{
		color:"transparent"
		width:parent.width-search.width
		height:search.height
		visible:!field.visible
		}
		TextField{
			id:field
			visible:false
			width:parent.width-search.width
			height:row.height
			font.pixelSize: 18
			 onTextChanged: {
				filter(text);
			}
			

		}
		Button{
		id:search
			icon.source:"search.png"
			display:Button.IconOnly
			onClicked:{
			
			field.visible=!field.visible;
			field.focus=true
			
			}
		}
		
	}
	MenuSeparator{
		id:separator
		width:parent.width
	}
	
	ListView{
    id:view
	width:parent.width
	height:parent.height-(row.height+separator.height)
    clip: true
    model:field.text == "" ? process.timeZone.length : searchModel
	delegate:Button{
		text:field.text == "" ? process.timeZone[index] : searchModel[index]
		width:view.width
		height:74
		
		onClicked:{
		
			process.startProcess("sudo timedatectl set-timezone "+text);
			popup.close();
		}
	}
	
	
   }
   }
	
}