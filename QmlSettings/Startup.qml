import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {





property var highlights:[]


ColumnLayout{
//spacing:5
anchors.fill:parent
  ListView{
	clip:true
      Layout.fillWidth:true
	   Layout.fillHeight:true
       model:startupApps.startupApps.length;
    delegate:Button{
            highlighted: highlights.includes(index);
            width: parent.width
            text:startupApps.startupApps[index][0];
			icon.color:"transparent"
           
               icon.source:"image://icons/"+startupApps.startupApps[index][1]
              
            height: window.mediumSize
			onClicked:{
			if(highlights.length!==0){
                    if(!highlighted){
                        highlights.push(index);
                    }else{
                        highlights.splice(highlights.indexOf(index), 1);
                    }
                        highlights= highlights;
                    return;
                }
			
			}
			onPressAndHold:{
				
				  highlights.push(index);
               highlights= highlights;
			}
        

        }
		




    }
	Button{
	id:add
		text:highlights.length===0 ? "+" : "DELETE"
		 Layout.fillWidth:true
		height:window.mediumSize
		display:Button.TextOnly
		font.pixelSize:15
		onClicked:{
		if(highlights.length===0 ){
		
			popup.open();
		}else{
			for(var i=0;i<highlights.length;i++){
				startupApps.deleteApp(startupApps.startupApps[i][3]);
			}
			highlights=[]
		
		}
		}
	}



	Popup{
	
	id:popup
	width:parent.width
	height:parent.height
	
	 MouseArea{
        id:mouse
        anchors.fill:parent
        acceptedButtons: Qt.BackButton
        onPressed: {

          popup.close();
        }
    }
	
	ListView{
	clip:true
        anchors.fill: parent
       model:launcher.programs.length;
    delegate:Button{
           
            width: parent.width
            text:launcher.programs[index][0];
			icon.color:"transparent"
           
               icon.source:"image://icons/"+launcher.programs[index][1]
              
            height: window.mediumSize
			onClicked:{
			startupApps.addApp(launcher.programs[index][6]);
			popup.close();
			
			}
        

        }
	}
}

}






}
