#!/usr/bin/env python
# -*- coding: utf-8 -*-
import shelve


class Idea:
    titulo = ""
    descripcion = ""
    campo = ""
    minaporte = 0.0
    mindinero = 0.0
    estado = ""
    fechater = ""
    valoract = 0.0
    documentoper = ""
    codigo = ""
    def __init__ (self,t,d,c,ma,md,es,ft,v,dp,cd):
        self.titulo = t
        self.descripcion = d
        self.campo = c
        self.minaporte = ma
        self.mindinero = md
        self.estado = es
        self.fechater = ft
        self.valoract = v
        self.documentoper = dp
        self.codigo = cd
class Persona:
    nombre = ""
    documento = ""
    cuenta = ""
    pagina = ""
    def __init__ (self,n,d,c,p):
        self.nombre = n
        self.documento = d
        self.cuenta = c
        self.pagina = p
class Donador:
    nombre = ""
    mail = ""
    direccion = ""
    valordon = 0.0
    cuenta = ""
    codigoadon = ""
    def __init__ (self,n,m,d,v,c,cad):
        self.nombre = n
        self.cuenta = c
        self.mail = m
        self.valordon = v
        self.direccion = d
        self.codigoadon = cad
class Fecha:
    ano = 0
    mes = 0
    dia = 0
    def __init__ (self,a,m,d):
        self.ano = a
        self.mes = m
        self.dia = d
    def crearfecha(self):
        return (str(self.ano)+"/"+str(self.mes)+"/"+str(self.dia))
    
def adicionar(cosa,arreglo):
    arreglo.append(cosa)

def crearcodigo (documento,fecha):
    codigo = ""
    codigo = documento+fecha
    return codigo
def actualizarestado (ano,mes,dia,ideas):
    rta= ""
    for vc in range (len(ideas)):
        if (ideas[vc].fechater.ano == ano):
            if(ideas[vc].fechater.mes == mes):
                if(ideas[vc].fechater.dia > dia):
                    rta = "SI"
                if(ideas[vc].fechater.dia <= dia):
                    if(ideas[vc].valoract >= ideas[vc].mindinero):
                        rta = "NO PERO SI"
                    if(ideas[vc].valoract < ideas[vc].mindinero):
                        rta = "NO PERO TAMPOCO"
            if(ideas[vc].fechater.mes < mes):
                if(ideas[vc].valoract >= ideas[vc].mindinero):
                        rta = "NO PERO SI"                        
                if(ideas[vc].valoract < ideas[vc].mindinero):
                        rta = "NO PERO TAMPOCO"                        
            if( ideas[vc].fechater.mes > mes):
                rta = "SI"                
        if(ideas[vc].fechater.ano > ano):
            rta = "SI"            
        if(ideas[vc].fechater.ano < ano):
            if(ideas[vc].valoract >= ideas[vc].mindinero):
                rta = "NO PERO SI"
            if(ideas[vc].valoract < ideas[vc].mindinero):
                rta = "NO PERO TAMPOCO"
        if(rta == "SI"):
            ideas[vc].estado = "Abierto"
        if(rta == "NO PERO SI"):
            ideas[vc].estado = "Cerrado y cumplió meta"
        if(rta == "NO PERO TAMPOCO"):
            ideas[vc].estado = "Cerrado y no cumplió meta"

donantes,ideas,personas = [],[],[]
opc = ""
while (opc != "8"):
    opc = input("\n1)Adicionar idea. \n2)Buscar idea a apoyar. \n3)Donar a una idea. \n4)Enlistar donantes de una idea. \n5)Ingresas fecha para actualizacion de estados." +
                "\n6)Guardar datos de informacion. \n7)Leer y cargar datos de informacion. \n8)Salir \nQue opcion desea:  ")
    if(opc == "1"):
        documento = input ("Ingrese el documento de identidad de la persona que brinda la idea:  ")
        persona= Persona(input("Ingrese el nombre de la persona:  "),documento,
                         input("Ingrese el numero de cuenta donde se podra hacer el aporte:  "),
                         input("Ingrese el link de una pagina web donde se pueda profundizar la descripcion del programa:  "))
        adicionar(persona,personas)
        ano = int(input("Ingrese la fecha de terminacion:  Ano(AAAA): "))
        mes = int(input("                                  Mes(MM):  "))
        dia = int(input("                                  Día(DD):  "))
        fechater = Fecha(ano,mes,dia)
        idea = Idea(input("Ingrese el nombre de la idea:  "),
                    input("Realice una descripcion del producto del software, y para que servira cuando este elaborado:  "),
                    input ("Ingrese el campo en que se desarrolla la idea (salud, comercio, etc.):  "),
                    float(input("Ingrese el valor del minimo aporte que se podra realizar:  ")),
                    float(input("Ingrese el valor minimo para poder elaborar la idea:  ")),
                    "Abierto",fechater,0.0,documento,documento+fechater.crearfecha())
        adicionar(idea,ideas)
    elif(opc == "2"):
        campo = input("Ingrese el campo de la ideas que desea conocer:  ")
        for vc in range (len(ideas)):
            if (ideas[vc].campo == campo):
                print("\n#Nombre de Creador:  " + personas[vc].nombre + " Nombre de Idea: " + ideas[vc].titulo + " Codigo: " + ideas[vc].codigo + " Descripcion:  " +
                      ideas[vc].descripcion + " Pagina web de la idea:  " + personas[vc].pagina + "  Valor minimo para poder aportar:  " + str(ideas[vc].minaporte) +
                      "  Valor para desarrollar la idea: " + str(ideas[vc].mindinero) + "  Estado: " + ideas[vc].estado + " Fecha de terminacion: " +
                      ideas[vc].fechater.crearfecha() + " Valor recaudado hasta el momento: " + str(ideas[vc].valoract) +  "\n")
    elif(opc == "3"):
        codigo = input("Ingrese el codigo de la idea a la que desea hacer su donacion:  ")
        for y in range (len(ideas)):
            if (ideas[y].codigo == codigo):
                valoradon = float(input("Ingrese el valor a donar:  "))
                if(valoradon >= ideas[y].minaporte):
                    donante = Donador(input("Ingrese su nombre:  "),input("Ingrese su coreo electronico:  "),input("Ingrese su direccion de residencia actual:  "),
                                      valoradon,input("Ingrese su numero de cuenta en caso de devolucion:  "),codigo)
                    adicionar(donante,donantes)
                    ideas[y].valoract = ideas[y].valoract + valoradon
                elif(valoradon < ideas[y].minaporte):
                    print("Su aporte es demasiado bajo para la idea que desea apoyar")
    elif(opc == "4"):
        codigo = input("Ingrese el codigo del proyecto:  ")
        for vc in range (len(donantes)):
            if(donantes[vc].codigoadon == codigo):
                print("\n#Nombre de donante:  " + donantes[vc].nombre + " Valor donado: " + str(donantes[vc].valordon))
    elif( opc == "5"):
        ano = input("Igrese la fecha de hoy: Ano(AAAA): ")
        mes = input("                        Mes(MM): ")
        dia = input("                        Día(DD): ")
        actualizarestado(ano,mes,dia,ideas)
        for vc in range (len(ideas)):
            if(ideas[vc].estado == "Cerrado y no cumplió meta"):
                for i in range (len(donantes)):
                    if( ideas[vc].codigo == donantes[i].codigoadon):
                        print( "#Nombre de idea que no cumplio meta:  " + ideas[vc].titulo + "\n Devoluciones: \n              Nombre de persona: " +
                               donantes[i].nombre + "  Valor a devolver:  " + donantes[i].valordon )                
    elif(opc == "6"):
        fd = shelve.open(input("Como llamará el archivo:  "))
        fd["Las Ideas"] = ideas
        fd["Los Donantes"] = donantes
        fd["Las Personas"] = personas
        fd.close()
    elif(opc == "7"):
        fd = shelve.open(input("Cual es el nombre del archivo:  "))
        try:
            personas = fd["Las Personas"]
            ideas = fd["Las Ideas"]
            donantes = fd["Los Donantes"]
        except:
            fd["Las Personas"] = personas
            fd["Los Donantes"] = donantes
            fd["Las Ideas"] = ideas
        fd.close()
