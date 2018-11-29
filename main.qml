import QtQuick 2.9
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.0

ApplicationWindow {
    id:app
    visible: true
    width: 640
    height: 480
    title: "Menu Donaciònes"
    color: "white"
    visibility: 'Maximized'
    property int area: -1
    property int fs: width*0.02

    onAreaChanged: {
        if(area===0){
            xApp.focus=true
        }
    }

    Settings{
        id: appSettings
        category: 'conf-ideas'
        property bool logViewVisible

        //Variables de Actualizaciòn
        property string ubicacionExePython
        property string ubicacionCodigoPython

        property int lvh
    }
   Item{
        id:xApp
        anchors.fill: parent
        Connections {target: unik;onUkStdChanged: procesar((''+unik.ukStd));}
        Connections {target: unik;onStdErrChanged: procesar((''+unik.ukStd));}

        Column{
            id: menuPrincipal
            anchors.centerIn: parent
            spacing: 10
            visible:app.area===0
            Text {
                text: '<b>¿Que opción desea?</b>'
                font.pixelSize: 28
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button{//1
                text: 'Adicionar Idea'
                font.pixelSize: 20
                onClicked: {
                    app.area=1
                    unik.writeRun('1\n')
                }
            }
            Button{//2
                text: 'Buscar Idea a Apoyar'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//3
                text: 'Donar a Idea'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//4
                text: 'Enlistar Donantes de una idea'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//5
                text: 'Ingresar Fecha para Actualizaciòn de Estados'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//6
                text: 'Guardar datos de Informaciòn'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//7
                text: 'Leer y cargar datos de Informaciòn'
                font.pixelSize: 20
                onClicked: mensaje.text='Hola boton 2'
            }
            Button{//8
                text: 'Salir'
                font.pixelSize: 20
                onClicked: Qt.quit()
            }
        }
        Text {
            id: txtSplash
            text: '<b>Ideas</b>'
            font.pixelSize: 48
            anchors.centerIn: parent
            visible:app.area===-1
        }
        Xfd{
            id:xFd
        }//Formulario Datos
        Xgi{
            id:xGi
        }//Guardar Idea
        Xbi{
            id:xBi
        }//Buscar Idea
        Xcd{
            id:xCd
        }//Cargar Donación
        Xca{
            id:xCa
        }//Cargar Archivo
        Xv1{
            id:xV1
        }//Visor 1

        LogView{
            width: parent.width
            height: appSettings.lvh
            fontSize: app.fs
            topHandlerHeight: Qt.platform.os!=='android'?app.fs*0.25:app.fs*0.75
            anchors.bottom: parent.bottom
            //visible: appSettings.logViewVisible
        }
        focus:true
        Keys.onEscapePressed:  Qt.quit()
        Keys.onDigit0Pressed: {
            unik.writeRun('\n')
        }
        Keys.onDigit1Pressed: {
            app.area=1
            unik.writeRun('1\n')
        }
        Keys.onDigit2Pressed: {
            app.area=2
            unik.writeRun('2\n')
        }
        Keys.onDigit3Pressed: {
            app.area=3
            unik.writeRun('3\n')
        }
        Keys.onDigit6Pressed: {
            app.area=6
            unik.writeRun('6\n')
        }
        Keys.onDigit7Pressed: {
            app.area=7
            unik.writeRun('7\n')
        }
    }
    Timer{
        id:tstart
        running: true
        repeat: false
        interval: 2000
        onTriggered: {
            unik.run('"'+appSettings.ubicacionExePython+'" "'+appSettings.ubicacionCodigoPython+'"')
        }
    }
    FileDialog {
        id: fileDialog1
        title: "Seleccione el Ejecutable Python"
        visible: false
        onAccepted: {
            var f0=fileDialog1.fileUrls[0]
            appSettings.ubicacionExePython=f0
            console.log('Ejecutable Python: '+f0)
        }
        onRejected: {

        }
        Component.onCompleted: {
            var f0=(''+unik.getPath(4)).replace('/Roaming/nextsigner/unik','/Local/Programs/Python/Python37-32')
            folder='file:///'+f0
            if(appSettings.ubicacionExePython===''){
                appSettings.ubicacionExePython=f0+'/python.exe'
                console.log('Ubicación por defecto de Python: '+f0)
            }
        }
    }
    FileDialog {
        id: fileDialog2
        title: "Seleccione el Código Python"
        visible: false
        onAccepted: {
            var f0=fileDialog2.fileUrls[0]
            appSettings.ubicacionCodigoPython=(''+f0).replace('file:///','')
            console.log('Código Python: '+(''+f0).replace('file:///',''))
        }
        onRejected: {

        }
        Component.onCompleted: {
            var f0=''+appsDir+'/ideas'
            folder='file:///'+f0
            if(appSettings.lvh<=0){
                appSettings.lvh=300
            }
            if(appSettings.ubicacionCodigoPython===''){
                appSettings.ubicacionCodigoPython=(f0+'/proyecto.py').replace('file:///','')
                console.log('Ubicación por defecto de Código Python: '+(f0+'/proyecto.py').replace('file:///',''))
            }
        }
    }
    Component.onCompleted: {
        console.log('Ubicación del Ejecutable Python: '+appSettings.ubicacionExePython)
        console.log('Ubicación del Código Python: '+appSettings.ubicacionCodigoPython)

    }
    function procesar(l){
        var m0
        //Buscar Idea
        if((''+l).indexOf("#Nombre de Creador:")>=0){
            m0=(''+l).split('1)Adicionar idea')
            xV1.txt=m0[0]
            xV1.visible=true
            return
        }

        if((''+l).indexOf('Que opcion desea')>=0){
            app.area=0
            return
        }
        if((''+l).indexOf('Ingrese el documento de identidad de la persona que brinda la idea')>=0){
            xFd.paso=1
            return
        }
        if((''+l).indexOf('Ingrese el nombre de la persona')>=0){
            xFd.paso=2
            return
        }
        if((''+l).indexOf('Ingrese el numero de cuenta donde se podra hacer el aporte')>=0){
            xFd.paso=3
            return
        }
         if((''+l).indexOf('Ingrese el link de una pagina web donde se pueda profundizar la descripcion del programa')>=0){
            xFd.paso=4
            return
        }
        if((''+l).indexOf('Ingrese la fecha de terminacion')>=0){
            xFd.paso=5
            return
        }
        if((''+l).indexOf('Ingrese el nombre de la idea')>=0){
            xFd.paso=8
            return
        }
        if((''+l).indexOf('Realice una descripcion del producto del software')>=0){
            xFd.paso=9
            return
        }
        if((''+l).indexOf('Ingrese el campo en que se desarrolla la idea')>=0){
            xFd.paso=10
            return
        }
        if((''+l).indexOf('Ingrese el valor del minimo aporte que se podra realizar')>=0){
            xFd.paso=11
            return
        }
        if((''+l).indexOf('Ingrese el valor minimo para poder elaborar la idea')>=0){
            xFd.paso=12
            return
        }

        //Ingresar Cargar Donaciones
        if((''+l).indexOf('Ingrese el codigo de la idea a la que desea hacer su donacion:')>=0){
            xCd.paso=1
            return
        }
        if((''+l).indexOf('Ingrese su numero de cuenta en caso de devolucion')>=0){
            xCd.paso=7
            return
        }
    }
}
