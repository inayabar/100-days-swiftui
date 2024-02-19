//
//  ContentView.swift
//  WeSplit
//
//  Created by Iñaki Yabar Bilbao on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 15
    @FocusState private var amountIsFocused: Bool
    let tips = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        return grandTotal/Double(numberOfPeople)
    }
    
    var grandTotal: Double {
        return checkAmount + checkAmount*Double(tipPercentage)/100.0
    }
    
    var body: some View {
        Form {
            Section("Amount") {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<25, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            Section("How much tip do you want to leave?") {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tips, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total amount") {
                Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            
            Section("Total per person") {
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
        .navigationTitle("WeSplit")
        .toolbar {
            if amountIsFocused {
                Button("Done") {
                    amountIsFocused = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
