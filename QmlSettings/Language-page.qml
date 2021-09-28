import QtQuick 2.0
import QtQuick.Controls 2.2
Item {

Component.onCompleted: {
lang.language=lang.load();
}
    ListView{
   clip:true
    anchors.fill: parent
    model:lang.language.length;
    delegate: Button{
        width: parent.width
        height: 74
        text:lang.language[index];
    }

    }
}
