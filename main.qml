import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Menu Donaciònes"
    color: "blue"
    /*menuBar: MenuBar{
        Menu {
            title:  "Ideas"
            MenuItem { text:  "Adicionar Idea" }
            MenuItem { text:  "Buscar Idea a Apoyar" }
        }
    }*/

    /*Aqui debajo haremos los botones*/
    Column{
        anchors.centerIn: parent
        spacing: 10
        Button{
            text: 'Adicionar Idea'
            onClicked: mensaje.text='Hola boton 1'
        }
        Button{
            text: 'Buscar Idea a Apoyar'
            onClicked: mensaje.text='Hola boton 2'
        }
        Text {
            id: mensaje
            font.pixelSize: 30
            color: 'yellow'
        }
    }
}
