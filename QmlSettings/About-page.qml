import QtQuick 2.0
import QtQuick.Controls 2.2
Item {

    property  var  names: ["Ram","Free Ram","Cpu name","Cpu clock","Cpu cache","Kernel"]

 Component.onCompleted: {
  info.reload();
  
  console.log(info.info.length);
}


    ListView{
        id:view
        anchors.fill: parent
        clip: true
        model:info.info.length
        delegate: Label{
			text:names[index]+":\n"+info.info[index];
			height:window.mediumSize
        }
    }

}
