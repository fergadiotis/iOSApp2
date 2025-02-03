//
//  OrderCard.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import SwiftUI

struct OrderCard: View {
    let order: CoffeeOrder
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Order for: \(order.name)")
                .font(.headline)
            Text("Size: \(order.coffeeSize)")
            Text("Type: \(order.coffeeType)")
            if !order.addOns.isEmpty {
                Text("Add-Ons: \(order.addOns.joined(separator: ", "))")
            }
            if !order.specialRequest.isEmpty {
                Text("Special Request: \(order.specialRequest)")
                    .italic()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    OrderCard(order: CoffeeOrder(
        name: "Tassos Fergadiotis",
        coffeeSize: "Large",
        coffeeType: "Latte",
        addOns: ["Whipped Cream"],
        specialRequest: "Extra hot"
    ))
    .padding()
    .background(Color.gray.opacity(0.1))
}

