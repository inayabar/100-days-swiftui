//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Iñaki Yabar Bilbao on 22/02/2024.
//

import SwiftUI

struct ContentView: View {
   @State private var order: Order = Order(type: .vanilla, cupcakeAmount: 3, hasSpecialRequests: false, extraFrosting: false, sprinkles: false)
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Flavour", selection: $order.type) {
                        ForEach(CupakeType.allCases, id: \.rawValue) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)

                }
                
                Section {
                    Toggle("Any special requests?", isOn:$order.hasSpecialRequests)
                    
                    if(order.hasSpecialRequests) {
                        Toggle("Extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.sprinkles)
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Delivery details")
                        })
                    }
                }
                
            }
            .navigationTitle("Cupcake order")
        }
    }
}

#Preview {
    ContentView()
}
