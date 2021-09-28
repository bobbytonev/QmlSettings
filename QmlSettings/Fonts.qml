import QtQuick 2.8
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
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
ListView {
id:view
    anchors.fill: parent; 
    model: Qt.fontFamilies()
	clip:true
    delegate: Button {
	height:window.mediumSize
	highlighted:modelData==tcm.theme[0]
	width:ListView.view.width
		text:modelData; 
		font.family: modelData
		onClicked:{
		settings.writeThemeConfig("Font",modelData);
		popup.close();
        }
    }
}

}