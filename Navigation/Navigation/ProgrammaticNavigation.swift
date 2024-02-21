//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
                
                NavigationLink("Select 3", value: 3)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
