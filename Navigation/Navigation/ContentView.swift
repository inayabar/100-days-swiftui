//
//  ContentView.swift
//  Navigation
//
//  Created by Iñaki Yabar Bilbao on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self, destination: {id in Text("Some \(id)")})
        }
    }
}

#Preview {
    ContentView()
}
