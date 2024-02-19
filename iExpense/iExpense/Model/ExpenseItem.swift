//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Iñaki Yabar Bilbao on 18/01/2024.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
