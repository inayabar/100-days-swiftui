//
//  Activities.swift
//  ProgressTracking
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import Foundation

struct Activity: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    var count: Int = 0
}

@Observable
class Activities {
    var items: [Activity]
    
    init(items: [Activity]) {
        self.items = items
    }
    
    func replace(activity: Activity, with other: Activity) {
        guard let firstIndex = items.firstIndex(of: activity) else {
            return
        }
        
        items[firstIndex] = other
    }
}
