import QtQuick 2.8
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15

import QtQuick.Dialogs 1.0
Item {
    id: item1


    property var buttonNames : ["Themes","Icons","Font"]
    property var propertyIndex


   ColorDialog {
        id: colorDialog
		
        
		
		title: "Please choose a color"
        onAccepted: {
           settings.writeSettings(propertyIndex,colorDialog.color);
        }
		
		
    }
		
		//ColorPopup{
			//id: colorDialog
			//onAccepted: {
			
				//settings.writeSettings(propertyIndex,colorDialog.color);
			//}
		
			
			
		//}

Fonts{
id:fonts;
}
ThemePopup{
id:theme;
}  
	
	
	


ListView{
anchors.fill: parent
clip:true
id:view


  header:Column{
      width: parent.width
      Repeater{
          model:buttonNames.length
          Button{
              id:pair
              width: parent.width
              text:buttonNames[index];
              font.pixelSize: 14
              height: window.mediumSize

          
		  onClicked:{
			if(index===2)
				fonts.open();
			if(index==0)
				theme.open();
			
		  }

          }
      }
      MenuSeparator{
          width: parent.width


      }
  }
  model:msg.colors.length
  delegate: Button{

          width: view.width
          text:msg.colorsName[index]+":"+msg.colors[index]
          font.pixelSize: 14
          Rectangle{
              color:msg.colors[index]
            id:rect
              width: 32
              height: width
			  border.color:"black"
			  border.width:1

              x:16
              y:parent.height/2-height/2

          }
          height: window.mediumSize

      leftPadding:18+rect.width
onClicked: {
propertyIndex=index;
	
		colorDialog.close();
		colorDialog.open()
  
}
      }

  }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:2}D{i:1}
}
##^##*/
