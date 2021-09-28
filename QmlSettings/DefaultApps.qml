import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Popup {
width:parent.width
height:parent.height
visible:true
id:item
property alias view:view

property alias popup:popup
property var mimetype
property var names:["Audio","Image","Video","Web Browser","Maps"];



	 MouseArea{
       
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {

          item.close();
        }
    }



function refresh(viewIndex,text){
settings.writeDefaultAppsByFileType(item.mimetype,text);
				if(item.popup.opened){
					item.popup.popupView.itemAtIndex(viewIndex).appInfo=defaultApps.read(defaultApps.defaultApps[viewIndex][0])
					item.popup.popupView.itemAtIndex(viewIndex).appInfo=item.popup.popupView.itemAtIndex(viewIndex).appInfo;
				}else{
					item.view.itemAtIndex(viewIndex).appInfo=defaultApps.read(names[viewIndex].replace(" ",""))
					item.view.itemAtIndex(viewIndex).appInfo=item.view.itemAtIndex(viewIndex).appInfo;
				}
}

ListView{
 id:view
	clip:true
        anchors.fill: parent
       model:names.length
    delegate:Button{
           
            width: parent.width
			property var appInfo:defaultApps.read(names[index].replace(" ",""))
            text:names[index] + ":"+appInfo[0]
			icon.color:"transparent"
           
              icon.source:"image://icons/"+appInfo[1]
              
            height: window.mediumSize
			onClicked:{
			item.mimetype=names[index].replace(" ","");
			appChooser.startWith="Categories"
			appChooser.viewIndex=index
			appChooser.open();
			
			
			}
        

        }

		footer:Column{
		
		
			width:view.width
			
			MenuSeparator{
			width:parent.width
			}
			Button{
			text:"Choose default app by file type"
			width:parent.width
			height:window.mediumSize
			onClicked:{
			popup.open();
			}
			}
		
		}


    }
	
		Popup{
	id:popup
	width:parent.width
	height:parent.height
	visible:false
	
	property alias popupView:popupView
	onVisibleChanged:{
		if(visible){
			defaultApps.reload();
			
			}
	}
	
	
	 MouseArea{
        id:mouse
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {

          popup.close();
        }
    }
	ListView{
	id:popupView
		 anchors.fill:parent
		 model:defaultApps.defaultApps.length
		 clip:true
			delegate:Button{
			property var appInfo:defaultApps.read(defaultApps.defaultApps[index][0])
			width: popupView.width
			text:defaultApps.defaultApps[index][1]+":"+appInfo[0];
			icon.color:"transparent"
			icon.source: "image://icons/"+appInfo[1];
			height: window.mediumSize
			
			onClicked:{
			
			item.mimetype=defaultApps.defaultApps[index][0];
			appChooser.startWith="MimeType"
			appChooser.viewIndex=index
			appChooser.open();
			}
			
		}
		}






}
	
Popup{
	id:appChooser
	width:parent.width
	height:parent.height
	visible:false
	property var startWith
	
	property var viewIndex
	
	onVisibleChanged:{
		if(visible){
			defaultApps.load(item.mimetype,startWith);
			
			}
	}
	
	
	 MouseArea{
        id:mouse1
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {
			appChooser.close();
        }
    }
	ListView{
	id:appChooserView
		 anchors.fill:parent
		 model:defaultApps.apps.length
		 
		 header:Column{
			
			Button{
			height:window.mediumSize
			width:popupView.width
			text:"None"
			onClicked:{
				appChooser.close();
				refresh(appChooser.viewIndex,"");
			}	
			}
			MenuSeparator{
				width:popupView.width
			}
		 }
		 clip:true
			delegate:Button{
			width: appChooserView.width
			text:defaultApps.apps[index][0]
			icon.color:"transparent"
			icon.source:"image://icons/"+defaultApps.apps[index][1]
			height: window.mediumSize
			onClicked:{
			appChooser.close();
			refresh(appChooser.viewIndex,defaultApps.apps[index][0]+","+defaultApps.apps[index][1]+","+defaultApps.apps[index][2])
				/*
				settings.writeDefaultAppsByFileType(item.mimetype,defaultApps.apps[index][0]+","+defaultApps.apps[index][1]+","+defaultApps.apps[index][2]);
				if(item.popup.opened){
					item.popup.popupView.itemAtIndex(appChooser.viewIndex).appInfo=defaultApps.read(defaultApps.defaultApps[appChooser.viewIndex][0])
					item.popup.popupView.itemAtIndex(appChooser.viewIndex).appInfo=item.view.itemAtIndex(appChooser.viewIndex).appInfo;
				}else{
					item.view.itemAtIndex(appChooser.viewIndex).appInfo=defaultApps.read(names[appChooser.viewIndex].replace(" ",""))
					item.view.itemAtIndex(appChooser.viewIndex).appInfo=item.view.itemAtIndex(appChooser.viewIndex).appInfo;
				}
				*/
			}
			
		}
		}
}



}
