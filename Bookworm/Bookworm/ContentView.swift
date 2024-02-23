//
//  ContentView.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add student") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    modelContext.insert(Student(id: UUID(), name: "\(firstNames.randomElement()!) \(lastNames.randomElement()!)"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Student.self)
}
