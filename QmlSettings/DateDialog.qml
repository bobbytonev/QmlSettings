import QtQuick 2.0
import QtQuick.Controls 2.2




Popup{
id:popup
modal:true
x:parent.width/2-width/2
y:parent.height/2-height/2


property var years:[]

property var currentDate:[]


property var months:[31,28,31,30,31,30,31,31,30,31,30,31]

Component.onCompleted:{
years=[]
	for(var i=1900;i<2200;i++){
		years.push(i);
	}
years=years;

}
function checkLeapYear(year) {

   
    if ((0 == year % 4) && (0 != year % 100) || (0 == year % 400)) {
      return true;
    } else {
       return false;
    }
}



	function formatText(count, modelData) {
        var data = count <= 40 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }
	
	
    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            //horizontalAlignment: Text.AlignHCenter
            //verticalAlignment: Text.AlignVCenter
           
        }
    }
	
   
	Column{
	anchors.centerIn: parent
    Row {
        id: row
	
		
        Tumbler {
            id: month
            model: 12
			delegate:delegateComponent
			currentIndex:currentDate[0]-1
           
        }

        Tumbler {
            id: day
            model:month.currentIndex === 1&&checkLeapYear(year.currentIndex) ? 29: months[month.currentIndex]
			delegate:delegateComponent
			currentIndex:currentDate[1]
           
        }

        Tumbler {
            id: year
			visible:am
            model:years
			//delegate:delegateComponent
			currentIndex:currentDate[2]-1900
         
        }
    }
   Row{
     
       Button{
           text:"Okey"
          // width:parent.width/2
		   onClicked:{
		   var y =year.currentIndex+1900;
		   var m=month.currentItem.text
		   var d =day.currentItem.text
			popup.close();
			 var s =Qt.formatDateTime(new Date(),"h m");
				var currentTime=s.split(" ");
			
			process.changeTime(y+"-"+m+"-"+d +" "+currentTime[0]+":"+currentTime[1]);
			
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