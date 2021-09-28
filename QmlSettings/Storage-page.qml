import QtQuick 2.0
import QtQuick.Controls 2.2
Item {

    property  var  names: ["Name","Read only","File System Type","Size in GB","Available Size in GB"]
	property var array:[]
 Component.onCompleted: {
  array=info.storageInfo();
  array=array;
  
  
}


    ListView{
        id:view
        anchors.fill: parent
        clip: true
        model:array.length
        delegate: Label{
			text:names[index]+":\n"+array[index];
			height:window.mediumSize
        }
    }

}
