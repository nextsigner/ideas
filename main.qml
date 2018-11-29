import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:app
    visible: true
    width: 640
    height: 480
    title: "Menu Donaciònes"
    color: "white"
    visibility: 'Maximized'
    property int area: 0
    property int fs: width*0.02


    /*menuBar: MenuBar{
        Menu {
            title:  "Ideas"
            MenuItem { text:  "Adicionar Idea" }
            MenuItem { text:  "Buscar Idea a Apoyar" }
        }
    }*/

    /*Aqui debajo haremos los botones*/
    Item{
        id:xApp
        anchors.fill: parent
        Connections {target: unik;onUkStdChanged: procesar((''+unik.ukStd).replace(/\n/g, '<br />'));}
        Connections {target: unik;onStdErrChanged: procesar((''+unik.ukStd).replace(/\n/g, '<br />'));}

        Column{
            id: menuPrincipal
            anchors.centerIn: parent
            spacing: 10
            visible:app.area===0
            Button{//1
                text: 'Adicionar Idea'
                onClicked: {
                   app.area=1
                    unik.writeRun('1\n')
                }
            }
            Button{//2
                text: 'Buscar Idea a Apoyar'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//3
                text: 'Donar a Idea'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//4
                text: 'Enlistar Donantes de una idea'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//5
                text: 'Ingresar Fecha para Actualizaciòn de Estados'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//6
                text: 'Guardar datos de Informaciòn'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//7
                text: 'Leer y cargar datos de Informaciòn'
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//8
                text: 'Salir'
                onClicked: Qt.quit()
            }
            Text {
                id: mensaje
                font.pixelSize: 30
                color: 'yellow'
            }
        }
        Xfd{
            id:xFd
            Component.onCompleted: {
                //unik.run('"C:/Users/qt/AppData/Local/Programs/Python/Python37-32/python.exe" "E:/nsp/unik-dev-apps/ideas/proyecto.py"')
            }
        }//Formulario Datos

        LogView{
            width: parent.width
            height:300
            //height: appSettings.lvh
            fontSize: app.fs
            topHandlerHeight: Qt.platform.os!=='android'?app.fs*0.25:app.fs*0.75
            anchors.bottom: parent.bottom
            //visible: appSettings.logViewVisible
        }
        focus:true
        Keys.onEscapePressed:  Qt.quit()

    }
    Timer{
        id:tstart
        running: true
        repeat: false
        interval: 2000
        onTriggered: {
            unik.run('"C:/Users/Usuarios/AppData/Local/Programs/Python/Python37-32/python.exe" "C:/Users/Usuario/Documents/unik/ideas/proyecto.py"')
        }
    }
    function procesar(l){

        if((''+l).indexOf('Ingrese el documento de identidad de la persona que brinda la idea')>=0){
            xFd.paso=1
            return
        }
        if((''+l).indexOf('Ingrese el nombre de la persona')>=0){
            xFd.paso=2
            return
        }
        if((''+l).indexOf('Ingrese el nombre de la persona')>=0){
            xFd.paso=3
            return
        }
        if((''+l).indexOf('Ingrese el numero de cuenta donde se podra hacer el aporte')>=0){
            xFd.paso=4
            return
        }
        if((''+l).indexOf('Ingrese el link de una pagina web donde se pueda profundizar la descripcion del programa')>=0){
            xFd.paso=5
            return
        }
        if((''+l).indexOf('Ingrese el link de una pagina web donde se pueda profundizar la descripcion del programa')>=0){
            xFd.paso=6
            return
        }
        if((''+l).indexOf('Ingrese la fecha de terminacion')>=0){
            xFd.paso=7
            return
        }
        if((''+l).indexOf('Ingrese el nombre de la idea')>=0){
            xFd.paso=8
            return
        }
        if((''+l).indexOf('Realice una descripcion del producto del software, y para que servira cuando este elaborado')>=0){
            xFd.paso=9
            return
        }
        if((''+l).indexOf('Realice una descripcion del producto del software, y para que servira cuando este elaborado')>=0){
            xFd.paso=10
            return
        }
        if((''+l).indexOf('Ingrese el campo en que se desarrolla la idea (salud, comercio, etc.)')>=0){
            xFd.paso=11
            return
        }
        if((''+l).indexOf('Ingrese el valor del minimo aporte que se podra realizar')>=0){
            xFd.paso=12
            return
        }

        //unik.set


        //"C:/Users/qt/AppData/Local/Programs/Python/Python37-32/python.exe" "E:/nsp/u
        //nik-dev-apps/ideas/proyecto.py"
    }
}
