//
//  ContentView.swift
//  Bibliotecaids
//
//  Created by Alumno on 11/2/26.
//

import SwiftUI

struct ContentView: View {
    
    let libros = [
        ("Clean Architecture", "Robert C. Martin", "2017", "Clean architecture"),
        ("The Pragmatic Programmer", "Andrew Hunt y David Thomas", "1999", "libro2"),
        ("Code Complete", "Steve McConnell", "2004", "libro3"),
        ("Design Patterns", "Gamma, Helm, Johnson y Vlissides", "1994", "libro4"),
        ("Refactoring", "Martin Fowler", "1999", "libro5"),
        ("The Mythical Man-Month", "Frederick P. Brooks Jr.", "1975", "libro6"),
        ("Introduction to Algorithms", "Cormen, Leiserson, Rivest y Stein", "1990", "libro7"),
        ("Structure and Interpretation of Computer Programs", "Abelson y Sussman", "1985", "libro8"),
        ("Designing Data-Intensive Applications", "Martin Kleppmann", "2017", "libro9"),
        ("Head First Design Patterns", "Eric Freeman y Elisabeth Robson", "2004", "libro10")
    ]

    var body: some View {
        GeometryReader { geo in
            
            let esHorizontal = geo.size.width > geo.size.height
            
            ZStack {
                
                if esHorizontal {
                    Color(.systemTeal).ignoresSafeArea()
                } else {
                    Color(.systemBlue).ignoresSafeArea()
                }
                
                VStack {
                    
                    Text("Librería para IDS")
                        .font(esHorizontal ? .title : .largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                    
                    if esHorizontal {
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(libros, id: \.0) { libro in
                                    libroView(libro: libro, horizontal: true)
                                }
                            }
                            .padding()
                        }
                        
                    } else {
                        
                        ScrollView {
                            VStack(spacing: 15) {
                                ForEach(libros, id: \.0) { libro in
                                    libroView(libro: libro, horizontal: false)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
    
    func libroView(libro: (String, String, String, String), horizontal: Bool) -> some View {
        
        let ancho: CGFloat = horizontal ? 260 : 350
        let alto: CGFloat = horizontal ? 170 : 150
        
        return HStack {
            
            Image(libro.3)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 120)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(libro.0)
                    .font(horizontal ? .subheadline : .headline)
                    .bold()
                    .lineLimit(2)
                
                Text("Autor: \(libro.1)")
                    .lineLimit(1)
                
                Text("Año: \(libro.2)")
                    .italic()
            }
        }
        .frame(width: ancho, height: alto)
        .padding(10)
        .background(Color(.systemGray5).opacity(0.8))
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    ContentView()
}
