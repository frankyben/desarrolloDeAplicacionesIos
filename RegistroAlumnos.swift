import Foundation

enum NivelCurso: String {
case basico = "Básico"
case intermedio = "Intermedio"
case avanzado = "Avanzado"
}

enum EstadoAcademico: String {
case reprobado = "Reprobado"
case aprobado = "Aprobado"
case excelente = "Excelente"
}

struct Student {
let id: Int
let name: String
let age: Int
let email: String
}

class Curso {
let codigo: String
let nombre: String
let nivel: NivelCurso
let cupoMaximo: Int
var inscritos: [Student]

init(codigo: String, nombre: String, nivel: NivelCurso, cupoMaximo: Int) {
    self.codigo = codigo
    self.nombre = nombre
    self.nivel = nivel
    self.cupoMaximo = cupoMaximo
    self.inscritos = []
}

func inscribir(student: Student) -> Bool {
    if inscritos.count < cupoMaximo {
        inscritos.append(student)
        return true
    }
    return false
}

}

class Inscripcion {
let estudiante: Student
let curso: Curso
var calificaciones: [Double] = []

init(estudiante: Student, curso: Curso) {
    self.estudiante = estudiante
    self.curso = curso
}

func agregarCalificacion(calificacion: Double) {
    guard calificacion >= 0 && calificacion <= 10 else {
        print("Calificación inválida")
        return
    }
    calificaciones.append(calificacion)
}

var average: Double {
    guard !calificaciones.isEmpty else { return 0.0 }
    let suma = calificaciones.reduce(0, +)
    return suma / Double(calificaciones.count)
}

var estado: EstadoAcademico {
    if average < 6 {
        return .reprobado
    } else if average < 9 {
        return .aprobado
    } else {
        return .excelente
    }
}

}

class CampusSystem {
var estudiantes: [Student] = []
var cursos: [Curso] = []
var inscripciones: [Inscripcion] = []

func registrarEstudiante(estudiante: Student) {
    guard !estudiante.name.isEmpty else { return }
    guard estudiante.age >= 16 else { return }
    guard estudiante.email.contains("@") else { return }
    estudiantes.append(estudiante)
    print("Estudiante \(estudiante.name) agregado correctamente.")
}

func registrarCurso(curso: Curso) {
    for c in cursos {
        if c.codigo == curso.codigo { return }
    }
    cursos.append(curso)
    print("Curso \(curso.nombre) agregado correctamente.")
}

func inscribir(estudianteID: Int, cursoCodigo: String) {
    guard let estudiante = estudiantes.first(where: { $0.id == estudianteID }) else { return }
    guard let curso = cursos.first(where: { $0.codigo == cursoCodigo }) else { return }

    if curso.inscritos.contains(where: { $0.id == estudianteID }) { return }

    if curso.inscribir(student: estudiante) {
        let nueva = Inscripcion(estudiante: estudiante, curso: curso)
        inscripciones.append(nueva)
        print("Inscripción realizada correctamente.")
    }
}

func agregarCalificacion(estudianteID: Int, cursoCodigo: String, calificacion: Double) {
    guard let inscripcion = inscripciones.first(where: {
        $0.estudiante.id == estudianteID && $0.curso.codigo == cursoCodigo
    }) else { return }

    inscripcion.agregarCalificacion(calificacion: calificacion)
    print("Calificación \(calificacion) agregada a \(inscripcion.estudiante.name).")
}

func showReport() {
    print("=== REPORTE FINAL ===")

    for i in inscripciones {
        print("Estudiante: \(i.estudiante.name)")
        print("Curso: \(i.curso.nombre)")
        print("Calificaciones: \(i.calificaciones)")
        print("Promedio: \(String(format: "%.2f", i.average))")
        print("Estado: \(i.estado.rawValue)")
        print("----------------------")
    }
}

}

let sistema = CampusSystem()

let estudiante1 = Student(id: 1, name: "Carlos", age: 25, email: "carlos@gmail.com")
let estudiante2 = Student(id: 2, name: "Laura", age: 22, email: "laura@gmail.com")

let curso1 = Curso(codigo: "iOS", nombre: "Swift Básico", nivel: .basico, cupoMaximo: 2)

sistema.registrarEstudiante(estudiante: estudiante1)
sistema.registrarEstudiante(estudiante: estudiante2)

sistema.registrarCurso(curso: curso1)

sistema.inscribir(estudianteID: 1, cursoCodigo: "iOS")
sistema.inscribir(estudianteID: 2, cursoCodigo: "iOS")

sistema.agregarCalificacion(estudianteID: 1, cursoCodigo: "iOS", calificacion: 9.5)
sistema.agregarCalificacion(estudianteID: 1, cursoCodigo: "iOS", calificacion: 8.0)

sistema.agregarCalificacion(estudianteID: 2, cursoCodigo: "iOS", calificacion: 7.0)
sistema.agregarCalificacion(estudianteID: 2, cursoCodigo: "iOS", calificacion: 9.0)

sistema.showReport()