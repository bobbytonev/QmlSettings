import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Controls 2.5

Item {

Component.onCompleted: {
launcher.qmlReload()
console.log("Init");
}



    SwipeView {
        id: swipeView
        height: parent.height
        anchors.fill: parent
        //anchors.topMargin: 64
        anchors.bottomMargin: tabBar.height
        currentIndex: tabBar.currentIndex
		
		 onCurrentIndexChanged: {
			 if(currentIndex===1){
				startupApps.qmlReload()
			}
     
		}   
AllApps{

}

Startup{
}

    }

    TabBar {
        id: tabBar
        y: parent.height-tabBar.height
        width: parent.width
        position: TabBar.Footer
        currentIndex: swipeView.currentIndex
        background: Rectangle{
			color:"transparent"
        }

        TabButton {
            text: qsTr("All Apps")

        }
       
        TabButton {
            text: qsTr("Startup apps")

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
