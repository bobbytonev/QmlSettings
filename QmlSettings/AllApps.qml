import QtQuick 2.0
import QtQuick.Controls 2.15
Item {

id:item

property var appIndex

property bool unistalling:false



Component.onCompleted: {
		var list=launcher.getEnvSettings();
		
		if(list.length>1){
		
		var newVar=list[1].split("//").join(" ")
		
		for(var i=0;i<launcher.programs.length;i++){
	
			if(launcher.programs[i][0]==newVar){
				appIndex=i;
			}
		}
		
		
		popup.open();
		}

    }


  Loader { id: pageLoader; anchors.fill:parent }

    ListView{
	id:view
	clip:true
        anchors.fill: parent
       model:launcher.programs.length;
	   
	   header:Column{
	   Button{
		text:"Default apps"
		height:window.mediumSize
		width:view.width
		onClicked:{
			pageLoader.source=""
			pageLoader.source="DefaultApps.qml"
			pageLoader.item.open();
		}
		
	   }
	   MenuSeparator{
		width:view.width
	   }
	   }
    delegate:Button{
           
            width: view.width
            text:launcher.programs[index][0];
icon.color:"transparent"
           
               icon.source:"image://icons/"+launcher.programs[index][1]
              
            height:window.mediumSize
			onClicked:{
			
			appIndex=index;
			
			popup.open();
			
			}
        

        }




    }
	Popup{
	id:popup
	width:parent.width
	height:parent.height
	
	property var app
	property alias deleteApps:deleteApps
	
	Popup{
	id:deleteApps
	modal: true
	visible:!process.finish&&unistalling
	x:parent.width/2-width/2
	y:parent.height/2-height/2
	closePolicy:Popup.NoAutoClose
	
	Label{
		text:"Unistalling...."
		width:parent.width
		height:parent.height
	}
	
	
	
	onVisibleChanged:{
	
		if(!visible) console.log("HERE")
			//process.eval("pacman --noconfirm -Rsn "+popup.app,launcher.programs[item.appIndex][0],launcher.programs[item.appIndex][6])
		else{
			
			//process.eval("pacman --noconfirm -Rsn "+popup.app,launcher.programs[item.appIndex][0],launcher.programs[item.appIndex][6])
		}
		
	}
	onAboutToShow: {
			process.eval("pacman --noconfirm -Rsn "+popup.app,launcher.programs[item.appIndex][0],launcher.programs[item.appIndex][6])

	}
	onOpened:{
	
		//process.eval("pacman --noconfirm -Rsn "+popup.app,launcher.programs[item.appIndex][0],launcher.programs[item.appIndex][6])
		//deleteApps.close();
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
		 anchors.fill:parent
		 model:1
		 clip:true
	delegate:Column{
	spacing:20
	width: parent.width
		Button{
			width: parent.width
			display:Button.TextUnderIcon
            text:launcher.programs[item.appIndex][0];
			icon.color:"transparent"
			icon.source:"image://icons/"+launcher.programs[item.appIndex][1]
           
            height: 128
			enabled:false
		}
		
	Row{
	id: row;
	property alias deleteButton:deleteButton
	
	width: parent.width
		Button{
		id:deleteButton
			display:Button.TextOnly
			
			
			
			text:"UNISTALL"
			width: parent.width/2
			onClicked:{
				var splitString=launcher.programs[item.appIndex][2].split('/');
				popup.app=splitString[splitString.length-1];
				
				
				
				unistalling=true;
				process.finish=false
				
				
				
			}
		}
		Button{
			display:Button.TextOnly
			text:"FORCE CLOSE"
			width: parent.width/2
			onClicked:{
			var splitString=launcher.programs[item.appIndex][2].split('/');
			//popup.app=splitString[splitString.length-1];
			process.eval("pkill "+splitString[splitString.length-1],"","")
			}
		}
	}
	MenuSeparator{
	width:parent.width
	}
	Label{
		text:"EXEC:"+launcher.programs[item.appIndex][2];
		height: 74
		
		
	}
	
	Label{
		text:"Category:"+ (launcher.programs[item.appIndex][3] =="" ? "Unknown":launcher.programs[item.appIndex][3]); 
		height: 74
		
		
	}
	
	Label{
		text:"Version:"+ (launcher.programs[item.appIndex][4] =="" ? "Unknown":launcher.programs[item.appIndex][4]); 
		height: 74
		
		
	}
	
	Label{
		text:"Type:"+ (launcher.programs[item.appIndex][5] =="" ? "Unknown":launcher.programs[item.appIndex][5]); 
		height: 74
		
		
	}
	Label{
		text:"Mime types:"+ (launcher.programs[item.appIndex][7] =="" ? "Unknown":launcher.programs[item.appIndex][7]); 
		height: 74
		
		
	}
	
	}
	
	}
	
	
	
	
	}


}
