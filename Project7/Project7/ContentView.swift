//
//  ContentView.swift
//  Project7
//
//  Created by Iñaki Yabar Bilbao on 20/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}


struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}


