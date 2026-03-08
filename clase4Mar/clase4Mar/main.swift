//
//  main.swift
//  clase4Mar
//
//  Created by Alumno on 4/3/26.
//

import Foundation

enum MessageStatus : String {
    case enviado = "Enviado"
    case recibido = "Recibido"
    case leido = "Leido"
}



let status : MessageStatus = .enviado
print("Status : \(status)")

switch status{
case .enviado:
    print ("Mensaje enviado")
case .recibido:
    print ("Mensaje recibido")
case .leido:
    print ("Mensaje leido")
}

print("------------------------------")

enum PuntosCardinales : Int{
    case norte = 1
    case sur
    case este
    case oeste
}

let direccion : PuntosCardinales = .norte
print ("Punto cardinal: \(direccion.rawValue)")

enum Dias : Int{
    case lunes = 1
    case martes
    case miercoles
    case jueves
    case viernes
}


func dias (from number: Int) -> Dias?{

    Dias(rawValue: number)
    
}


var number = 2
if let dia = dias(from: number){
    print("El día numero \(number) es el \(dia)")
}else{
    print("Número inválido")
}

print("------------------------------")

enum semaforo {
    case red, yellow, green
}

func action (for s: semaforo) -> String{
    switch s{
    case .red:
        return "Alto"
    case .yellow:
        return"Precacución"
    case .green:
        return "Avanzar"
    }
}

print(action(for:.red))
print(action(for:.yellow))
print(action(for:.green))

print("------------------------------")

// enums con variables asociadas

enum LoadState{
    case idle
    case loading
    case succes (items: [String])
    case failure (message: String)
}

func render (_ state: LoadState){
    switch state {
    case .idle:
        print("Listo para buscar")
    case .loading:
        print("Cargando...")
    case .succes(let items):
        print("Resultados \(items)")
    case .failure(let message):
        print("Error \(message)")
    }
}

render(.idle)
render(.loading)
render(.succes(items: ["item1", "Item2","Item3"]))
render(.failure(message: "No se pudo cargar"))
print("------------------------------")
