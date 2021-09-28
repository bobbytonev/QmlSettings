import QtQuick 2.0
import QtQuick.Controls 2.2


Popup{
id:popup
modal:true
x:parent.width/2-width/2
y:parent.height/2-height/2
property bool am:false



property var currentTime:[]
function convertTo24(hours,modifier){


 if (hours === 12) {
    hours = 0;
  }

  if (modifier === 'PM') {
    hours = parseInt(hours, 10) + 12;
  }
  
 
}

function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }
	
	
    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
           
        }
    }
	


	
   
	Column{
	anchors.centerIn: parent
    Row {
        id: row
	
		Rectangle{
			width:amPmTumbler.width/2
			height:amPmTumbler.height
			color:"transparent"
			visible:!am
		}
        Tumbler {
            id: hoursTumbler
            model: am ? 12:24
			currentIndex:currentTime[0]
            delegate: delegateComponent
        }

        Tumbler {
            id: minutesTumbler
            model: 60
            delegate: delegateComponent
			currentIndex:currentTime[1]
        }

        Tumbler {
            id: amPmTumbler
			visible:am
            model:["AM", "PM"]
           // delegate: delegateComponent
        }
    }
   Row{
     
       Button{
           text:"Okey"
          // width:parent.width/2
		   onClicked:{
			popup.close();
			var h,m,modifier;
			m=amPmTumbler.currentItem.text
			h=hoursTumbler.currentIndex
			m=minutesTumbler.currentIndex
			if(am){
			h=convertTo24(h,modifier);
			}
			process.changeTime(h+":"+m);
		   }

       }
       Button{

           text:"Cancel"
            // width:parent.width/2
			 onClicked:{
				popup.close();
		   }

       }


   }
   
   }
   
 


}