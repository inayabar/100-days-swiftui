//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            TextField("Name", text: $order.name)
            TextField("Street", text: $order.streetAddress)
            TextField("City", text: $order.city)
            TextField("Zip", text: $order.zip)
                .keyboardType(.numberPad)
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Checkout")
                    })
                }
            }.disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order(type: .vanilla, cupcakeAmount: 3, hasSpecialRequests: false, extraFrosting: false, sprinkles: false))
}
