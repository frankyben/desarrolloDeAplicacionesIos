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

    var experiencia = [
        "Calculadora en Swift",
        "Programa de gestión de inventarios en Java"
    ]

    var education = ("Carrera técnica en turismo", 2020, true)

    @State private var showAlert: Bool = false
    @State private var isEnabled: Bool = true
    @State private var valor: Double = 50

    var body: some View {
        VStack(spacing: 20) {

            Image("fotoPerfil")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .offset(y:10)
                .clipShape(Circle())
                .shadow(color: .blue.opacity(0.60), radius: 20)

            Text("\(nombre), \(edad) años")
                .font(.title2)
                .fontWeight(.semibold)

            VStack(alignment: .leading, spacing: 8) {
                Text("Experiencia")
                    .font(.headline)

                ForEach(experiencia, id: \.self) { proyecto in
                    Text("• \(proyecto)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 8) {
                Text("Formación académica")
                    .font(.headline)

                Text("\(education.0) – \(String(education.1))")
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button("Cursos") {
                showAlert = true
            }
            .alert("Cursos en 2025", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(
                    "Curso 1: Desarrollo de apps en iOS\n" +
                    "Curso 2: Desarrollo de apps en Android\n" +
                    "Curso 3: Computación avanzada en Java"
                )
            }

            Toggle("Perfil", isOn: $isEnabled)
                .padding(.top)

            Text(isEnabled ? "Developer" : "Scrum Master")
                .foregroundColor(isEnabled ? .green : .red)
                .font(.headline)

            Text("Nivel: \(Int(valor))")

            Slider(value: $valor, in: 0...100, step: 1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
