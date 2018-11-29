import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle{
    id:r
    width: parent.width*0.7
    height: parent.height
    color: 'transparent'
    anchors.centerIn: parent
    visible:app.area===1
    property int paso: 0
    onVisibleChanged: {
        if(visible){
            //unik.writeRun('1\n')
        }
    }
    onPasoChanged: {
        //console.log('Se requiere paso '+paso)
    }
    Column{
        anchors.centerIn: parent
        spacing: app.fs*0.5

        //1
        Row{
            spacing: app.fs
            visible:r.paso===1
            Text{
                id:t1
                text: 'Ingrese Nùmero de Documento: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width-t1.contentWidth-app.fs*2
                height: 24
                TextInput{
                    id:tiNumDoc
                    width: parent.width
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //2
        Column{
            spacing: app.fs*0.5
            visible:r.paso===2
            Text{
                id:t2
                text: 'Ingrese el Nombre de la Persona: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiNomPer
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //3
        Row{
            spacing: app.fs*0.5
            visible:r.paso===3
            Text{
                id:t3
                text: 'Ingrese Nùmero de Cuenta donde se podrà hacer el aporte: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiNumCuenta
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }

        }

        //4
        Column{
            visible:r.paso===4
            Text{
                text: 'Ingrese el Link de una pàgina web donde se pueda profundizar la descripciòn del programa: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiLink
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }

        }

        //5-1
        Row{
            visible:r.paso===5
            Text{
                text: 'Ingrese la año de terminación: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiAnio
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: r.paso++
                }
            }

        }
        //5-2
        Row{
            visible:r.paso===6
            Text{
                text: 'Ingrese el mes de terminación: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiMes
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: r.paso++
                }
            }

        }
        //5-3
        Row{
            visible:r.paso===7
            Text{
                text: 'Ingrese el día de terminación: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiDia
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: r.paso=8
                }
            }

        }

        //6
        Row{
            visible:r.paso===8
            Text{
                text: 'Ingrese el nombre de la idea: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiNomIdea
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //7
        Column{
            visible:r.paso===9
            Text{
                text: 'Realice una descripciòn del producto del software y para que servirà cuando estè elaborado: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiDes
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //8
        Row{
            visible:r.paso===10
            Text{
                text: 'Ingrese el campo en que se desarrolla la idea (Salud, Comercio, etc): '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiNomCampo
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //9
        Row{
            visible:r.paso===11
            Text{
                text: 'Ingrese el valor del mìnimo aporte que se podrà realizar: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiValMinAporte
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }

        //10
        Row{
            visible:r.paso===12
            Text{
                text: 'Ingrese el valor mìnimo para poder elaborar la idea: '
                font.pixelSize: 20
            }
            Rectangle{
                border.width: 2
                radius: 6
                width: r.width
                height: 24
                TextInput{
                    id:tiValMinIdea
                    width: r.width-app.fs
                    height: 20
                    font.pixelSize: 20
                    anchors.centerIn: parent
                    Keys.onReturnPressed: unik.writeRun(text+'\n')
                }
            }
        }
    }
}
