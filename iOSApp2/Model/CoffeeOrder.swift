//
//  CoffeeOrder.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class CoffeeOrder: Identifiable {
    var id: UUID = UUID()
    var name: String
    var coffeeSize: String
    var coffeeType: String
    var addOns: [String]
    var specialRequest: String
    
    init(name: String = "",
         coffeeSize: String = "Medium",
         coffeeType: String = "Espresso",
         addOns: [String] = [],
         specialRequest: String = "") {
        self.id = UUID()
        self.name = name
        self.coffeeSize = coffeeSize
        self.coffeeType = coffeeType
        self.addOns = addOns
        self.specialRequest = specialRequest
    }
}
