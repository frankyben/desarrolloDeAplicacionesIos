//
//  ContentView.swift
//  myResumeeCarlosIslas
//
//  Created by Alumno on 21/1/26.
//

import SwiftUI

struct ContentView: View {
    var nombre = "Carlos"
    let edad = 23
    var experiencia = ["Calculadora en swift", "Programa de gestión de inventarios en Java"]
    var education = ("Carrera técnica en turismo",2020, true)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Nombre: \(nombre) Edad: \(edad)")
            Text("Experiencia:")
            ForEach(experiencia, id: \.self){proyecto in Text("- \(proyecto)")}
            Text("Formación académica:")
            Text ("Formación académica: \(education.0) - \(String(education.1))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
