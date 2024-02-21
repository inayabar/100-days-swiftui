//
//  CustomNavigationBar.swift
//  Navigation
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct CustomNavigationBar: View {
    @State private var title: String = "Skere"
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink(value: i, label: {
                    Text("Row \(i)")
                })
            }
            .navigationDestination(for: Int.self, destination: {i in
                Text("something \(i)")
            })
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Tap Me") {
                        // button action here
                    }
                }
            }
        }
    }
}

#Preview {
    CustomNavigationBar()
}
