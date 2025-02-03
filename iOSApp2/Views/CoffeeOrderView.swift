//
//  CoffeeOrderView.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import SwiftUI
import SwiftData

struct CoffeeOrderView: View {
   @Environment(\.modelContext) private var context
   @State private var name = ""
   @State private var selectedSize = "Medium"
   @State private var selectedType = "Espresso"
   @State private var addOns: [String] = []
   @State private var specialRequest = ""
   @State private var showingOrders = false
   
   let coffeeTypes = ["Espresso", "Latte", "Cappuccino", "Macchiato"]
   let addOnOptions = ["Whipped Cream", "Caramel"]
   
   // Size options with images
   struct SizeOption: Identifiable {
       let id = UUID()
       let name: String
       let imageName: String
       let iconScale: Double
   }
   
   let sizeOptions: [SizeOption] = [
       SizeOption(name: "Small", imageName: "small-cup", iconScale: 0.8),
       SizeOption(name: "Medium", imageName: "medium-cup", iconScale: 1),
       SizeOption(name: "Large", imageName: "large-cup", iconScale: 1.2),
       SizeOption(name: "Double Double", imageName: "DD", iconScale: 2.0)
   ]
   
   var body: some View {
       ScrollView {
           VStack(spacing: 20) {
               Text("Swift Coffee ☕️")
                   .font(.largeTitle)
                   .fontWeight(.bold)
                   .padding()
               
               TextField("Enter Your Name", text: $name)
                   .textFieldStyle(.roundedBorder)
                   .padding(.horizontal)
                   .frame(maxWidth: 300)
               
               // Custom size selection with images
               VStack {
                   Text("Select Size")
                       .font(.headline)
                   
                   HStack(spacing: 9) {
                       ForEach(sizeOptions) { option in
                           VStack {
                               Image(option.imageName)
                                   .resizable()
                                   .scaledToFit()
                                   .frame(height: 30 * option.iconScale)
                               Text(option.name)
                                   .font(.caption)
                           }
                           .frame(maxWidth: .infinity)
                           .padding()
                           .background(
                               RoundedRectangle(cornerRadius: 10)
                                   .fill(selectedSize == option.name ?
                                        Color.brown.opacity(0.2) : Color.gray.opacity(0.1))
                           )
                           .onTapGesture {
                               selectedSize = option.name
                           }
                       }
                   }
                   .padding(.horizontal)
               }
               
               Picker("Select Coffee Type", selection: $selectedType) {
                   ForEach(coffeeTypes, id: \.self) { type in
                       Text(type)
                   }
               }
               .pickerStyle(.segmented)
               .padding(.horizontal)
               
               Text("Add-Ons:")
                   .font(.headline)
               
               ScrollView(.horizontal, showsIndicators: false) {
                   HStack {
                       ForEach(addOnOptions, id: \.self) { addOn in
                           Button {
                               if addOns.contains(addOn) {
                                   addOns.removeAll { $0 == addOn }
                               } else {
                                   addOns.append(addOn)
                               }
                           } label: {
                               HStack {
                                   Image(systemName: addOns.contains(addOn) ?
                                       "checkmark.square.fill" : "square")
                                   Text(addOn)
                               }
                               .padding(.horizontal, 12)
                               .padding(.vertical, 8)
                               .background(
                                   RoundedRectangle(cornerRadius: 8)
                                       .fill(addOns.contains(addOn) ? Color.brown.opacity(0.2) : Color.gray.opacity(0.1))
                               )
                           }
                           .foregroundColor(.primary)
                       }
                   }
                   .padding(.horizontal)
               }
               
               TextField("Special Request", text: $specialRequest)
                   .textFieldStyle(.roundedBorder)
                   .padding(.horizontal)
                   .frame(maxWidth: 300)
               
               
               Button {
                   placeOrder()
               } label: {
                   HStack {
                       Image(systemName: "cup.and.heat.waves")
                       Text("Place Order")
                   }
                   .frame(width: 200)
                   .padding()
                   .background(Color.brown)
                   .foregroundColor(.white)
                   .clipShape(RoundedRectangle(cornerRadius: 10))
               }
               
               NavigationLink(destination: OrdersView()) {
                   HStack {
                       Image(systemName: "list.bullet")
                       Text("View Orders")
                   }
                   .frame(width: 200)
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .foregroundColor(.primary)
                   .clipShape(RoundedRectangle(cornerRadius: 10))
               }
           }
           .padding()
       }
       .navigationTitle("Create Order")
       .navigationBarTitleDisplayMode(.inline)
       .background(Color.gray.opacity(0.1))
   }
   
   private func placeOrder() {
       let newOrder = CoffeeOrder(
           name: name,
           coffeeSize: selectedSize,
           coffeeType: selectedType,
           addOns: addOns,
           specialRequest: specialRequest
       )
       context.insert(newOrder)
       name = ""
       specialRequest = ""
       addOns = []
   }
}

#Preview {
   NavigationStack {
       CoffeeOrderView()
           .modelContainer(for: CoffeeOrder.self, inMemory: true)
   }
}
