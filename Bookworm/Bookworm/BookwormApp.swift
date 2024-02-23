//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
