//
//  DifferentDataTypesNavigation.swift
//  Navigation
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

struct DifferentDataTypesNavigation: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    DifferentDataTypesNavigation()
}
