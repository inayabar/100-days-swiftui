//
//  Order.swift
//  CupcakeCorner
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import Foundation

@Observable
class Order: Codable {
    var type: CupakeType
    var quantity: Int
    var extraFrosting: Bool
    var sprinkles: Bool
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasSpecialRequests: Bool {
        didSet {
            if !hasSpecialRequests {
                extraFrosting = false
                sprinkles = false
            }
        }
    }
    
    init(type: CupakeType, cupcakeAmount: Int, hasSpecialRequests: Bool, extraFrosting: Bool, sprinkles: Bool) {
        self.type = type
        self.quantity = cupcakeAmount
        self.hasSpecialRequests = hasSpecialRequests
        self.extraFrosting = extraFrosting
        self.sprinkles = sprinkles
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        switch type {
        case .vanilla:
            cost += 0
        case .strawberry:
            cost += 1
        case .chocolate:
            cost += 2
        case .rainbow:
            cost += 3
        }
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for sprinkles
        if sprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

enum CupakeType: String, CaseIterable, Codable {
    case vanilla = "Vanilla"
    case strawberry = "Strawberry"
    case chocolate = "Chocolate"
    case rainbow = "Rainbow"
}
