//
//  NewExpense.swift
//  iExpense
//
//  Created by Iñaki Yabar Bilbao on 18/01/2024.
//

import SwiftUI

struct AddExpenseView: View {
    let expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @Environment(\.dismiss) private var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                Button("Save") {
                    expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                    dismiss()
                }
            }
            .navigationTitle("Add new expense")
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
