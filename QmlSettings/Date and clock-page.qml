import QtQuick 2.0
import QtQuick.Controls 2.2

import Qt.labs.settings 1.1

Item {




ClockDialog{
id:clockDialog
}
DateDialog{
id:dateDialog
}


TimeZonePopup{
id:timeZonePopup
}


ListView{
    id:view
    anchors.fill: parent
    clip: true
    model:1
    delegate: Column{
	
	Settings {
    id:settings
    property alias dateTime:dateTime.checked
    property alias timeZoneSwitch:timeZoneSwitch.checked
  

	}
	
        
		
		Switch{
		id:dateTime
            text:"Automatic date & time"
            height: window.mediumSize
            width: view.width
			onCheckedChanged: {
			var x = checked ? "true": "false"
				process.automaticTimeZone(x);
			}
        }
        Button{
            id:systemDate
           
            width: view.width
			enabled:!dateTime.checked
            height: window.mediumSize
            Timer{
             interval: 500; running:true ; repeat: true
              onTriggered: {
              
               var s =Qt.formatDateTime(new Date(),"MMM dd, yyyy");
                  if(systemDate.text!==s)
                        systemDate.text ="Set date\n"+s;;
                }
              Component.onCompleted: {
                 
                  var s =Qt.formatDateTime(new Date(),"MMM ddd, yyyy");
                     if(systemDate.text!==s)
                           systemDate.text ="Set date\n"+s;
                   }


               }
			   onClicked:{
				var s= Qt.formatDateTime(new Date(),"M d yyyy");
			   dateDialog.currentDate=s.split(" ");
			  // dateDialog.currentDate[0]-=1;
			   
			   dateDialog.open();
			   
			   }
        }
        Button{
            id:systemClock
            //text:"Set date\n"
			enabled:!dateTime.checked
            width: view.width
            height: window.mediumSize
            Timer{
             interval: 500; running:true ; repeat: true
              onTriggered: {
            var s =Qt.formatDateTime(new Date(),"hh:mm");
                  if(systemClock.text!==s)
                        systemClock.text ="Set time\n"+s;
                }
              Component.onCompleted: {

                  var s =Qt.formatDateTime(new Date(),"hh:mm");
                     if(systemClock.text!==s)
                           systemClock.text ="Set time\n"+s;
                   }


               }
			     onClicked:{
				 var s =Qt.formatDateTime(new Date(),"h m");
				 clockDialog.currentTime=s.split(" ");
			   //clockDialog.am=!timeFormat.checked
				clockDialog.open();
			   }
        }
        MenuSeparator{
            width: view.width
        }
        Switch{
		id:timeZoneSwitch
            text:"Automatic time zone"
            height: window.mediumSize
            width: view.width
			
        }
        Button{
            id:systemTimeZone
            //text:"Set time zone"
            width: view.width
			enabled:!timeZoneSwitch.checked
            height: window.mediumSize

            Timer{
             interval: 500; running:true ; repeat: true

              onTriggered: {

                  var a = new Date().getTimezoneOffset();
                  var res = -Math.round(a/60)+':'+-(a%60);
                  res = res < 0 ?res : '+'+res;

                        systemTimeZone.text ="Set timezone\nUTC"+res;
                }
              Component.onCompleted: {
                  var a = new Date().getTimezoneOffset();
                  var res = -Math.round(a/60)+':'+-(a%60);
                  res = res < 0 ?res : '+'+res;
                    systemTimeZone.text ="Set timezone\nUTC"+ res;
                   }
            }
			onClicked:{
				timeZonePopup.open();
			}
           }

        //MenuSeparator{
            //width: view.width
        //}
        //Switch{
           // id:timeFormat
           // text:"Use 24-hour format"
			//width: view.width
            //height: 74

           //}


    }
}

}
