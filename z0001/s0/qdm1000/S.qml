import QtQuick 2.0
import  "../../../"
Item {
    id: r
    width: app.an
    height: app.al-app.fs*2
    onVisibleChanged: {
        if(visible){
            app.mp.source="./a1.m4a"
            app.pa=pa
        }
    }
    Flickable{
        id:fk
        anchors.fill: r
        contentWidth: r.width
        contentHeight: fk.height>r.height?txt1.contentHeight+app.fs*10:txt1.contentHeight
        boundsBehavior: Flickable.StopAtBounds
        Text {
            id: txt1
            width: r.width*0.6
            font.pixelSize: app.fs*0.5
            color: app.c2
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
        }
    }
    property var ai: ["https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png","https://cdn.icon-icons.com/icons2/730/PNG/512/twitter_icon-icons.com_62765.png","http://icons.iconarchive.com/icons/dtafalonso/android-l/512/Youtube-icon.png"]
    Column{
        anchors.verticalCenter: r.verticalCenter
        anchors.right: r.right
        anchors.rightMargin:  (r.width*0.4-width)/2
        spacing: app.fs*0.5
        Text{
            id:te1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: app.fs*2
            color: app.c2
            font.family: 'FontAwesome'
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
        }
        Image{
            id:img1
            width: r.width*0.4-app.fs
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
            id:te2
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: app.fs*2
            color: app.c2
            font.family: 'FontAwesome'
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
        }
        Image{
            id:img2
            width: r.width*0.4-app.fs
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
            id:te3
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: app.fs*2
            color: app.c2
            font.family: 'FontAwesome'
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
        }
    }
    Xa{id:xa}
    Timer{
        running: r.visible
        repeat: true
        interval: 250
        onTriggered: {
            c2 ='<h2 class="'+app.lnl(0, 4)+'">Hemos llegado al fin del curso</h2>'
            c2+='<p class="'+app.lnl(4, 14)+'">'+p0+'</p>'
            c2+='<p class="'+app.lnl(14, 35)+'">'+p1+'</p>'
            c2+='<p class="'+app.lnl(35, 42)+'">'+p2+'</p>'
            c2+='<p class="'+app.lnl(42, 60)+'">'+p3+'</p>'
            c2+='<p class="'+app.lnl(60, 79)+'">'+p4+'</p>'
            txt1.text=c1+c2+c3


            if(app.lnl(0, 35)==='activo'){
                te1.text='<b>Fin</b><br><b>del</b><br><b>Curso</b><br>'
                te1.font.pixelSize=app.fs*2
                te1.horizontalAlignment=Text.AlignHCenter
            }else  if(app.lnl(35, 42)==='activo'){
                img1.visible=true
                img1.source=""+ai[0]
                img1.width=r.width*0.25
                te1.text='<b>https://github.com/nextsigner/qmlandia</b>'
                te1.font.pixelSize=app.fs*0.5
            }else  if(app.lnl(42, 50)==='activo'){
                img1.visible=true
                img1.source=""+ai[1]
                img1.width=r.width*0.25
                te1.text='<b>@nextsigner</b>'
                te1.font.pixelSize=app.fs
            }else  if(app.lnl(50, 60)==='activo'){
                img1.visible=true
                img1.source=""+ai[2]
                img1.width=r.width*0.25
                te1.text='<b>youtube.com/c/nextsigner</b>'
                te1.font.pixelSize=app.fs*0.5
            }else{
                te1.text=''
                te2.text=''
                te3.text=''
                img1.visible=false
                img2.visible=false
            }


        }
    }

    property string c1
    property string c2
    property string c3
    property string p0
    property string p1
    property string p2
    property string p3
    property string p4
    property string p5

    Component.onCompleted: {
        //Partes de la Estructura Html
        c1='<html><head><style>\n.activo{\nfont-size:'+parseInt(app.fs*0.65)+'px;\nbackground-color:'+app.c2+';\ncolor:'+app.c3+';\n}\n.inactivo{\nbackground-color:'+app.c3+';\ncolor:'+app.c2+';\n}</style></head><body>'
        c3='</body></html>'

        //Parrafos
        p0='Este mòdulo solo se ha agreado para incluir informaciòn adicional, datos que consideremos te puedan interesar o resultar ùtiles.'
        p1=' Talves en el momento en que tu estàs recibiendo esta informaciòn el curso aùn està en pleno proceso de evoluciòn y crecimiento. De ser asì te invitamos a participar en este curso aportando informaciòn, ideas a las vìas de comunicaciòn y contacto que te informamos a cada momento.'
        p2='Entre todos podemos construir una gran comunidad y crecer en el camino del conocimiento.'
        p3='Este proyecto ha sido creado para ser distribuido de manera libre y gratuita. Es un producto pensado y diseñado para la divulgaciòn y promociòn del conocimiento y las nuevas tecnologìas, es un aporte solidario a la sociedad y sin fines de lucro.'
        p4='Este curso ha sido realizado por @nextsigner y quienes han colaborado de manera significativa. Si quieres conocer la lista completa de todas las personas y empresas que han colaborado, presiona el boton Ver Colaboradores.'
        p5=''

        //Ayudas
        var h1= ''
        var c=''
        c+='import QtQuick 2.0\n
        Rectangle{\n
            id:ra\n
            anchors.fill:parent\n
            color:app.c3\n
            Text{\n
                id:ta\n
                font.pixelSize:app.fs\n
                color:app.c2\n
                anchors.centerIn:parent\n
            }\n
            Boton{\n
                w:app.fs\n
                h:w\n
                t:\'X\'\n
                c:app.c3\n
                b:app.c2\n
                anchors.right:parent.right\n
                onClicking:{\n
                    ra.visible=false\n
                }\n
            }\n
            Component.onCompleted:{\n
                var t=\'Personas:
    Natalia Soledad Pintos
    Oscar Nuñez Calzada
    Laura Jaramillo
    Natalia Gutierrez

Empresas:
    Digia Qt Project
    Movistar Argentina\'\n
                console.log(\'Agradecimientos: \'+t)
                ta.text=t\n
            }\n
        }\n'
        var c2=''
        c2+='import QtQuick 2.0\n
        Rectangle{\n
            id:ra\n
            Component.onCompleted:{\n
                app.s=1\n
            }\n
        }\n'
        var c3=''
        c3+='import QtQuick 2.0\n
        Rectangle{\n
            id:ra\n
            Component.onCompleted:{\n
                app.s=2\n
            }\n
        }\n'
        xa.addBa('Ir al Inicio del Curso','','inicio')
        xa.addBa('Ver Còdigo Fuente del Curso','',c2)
        xa.addBa('Ir al Sitio Oficial del Proyecto','',c3)
        xa.addBa('Ver Colaboradores','',c)
    }
}

