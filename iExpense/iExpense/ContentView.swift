//
//  ContentView.swift
//  iExpense
//
//  Created by Iñaki Yabar Bilbao on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var addExpenseViewPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    addExpenseViewPresented.toggle()
                }
            }
            .sheet(isPresented: $addExpenseViewPresented, content: {
                AddExpenseView()
            })
            .navigationTitle("iExpense")
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
