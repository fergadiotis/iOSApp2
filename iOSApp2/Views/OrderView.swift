//
//  OrderView.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import SwiftUI
import SwiftData

struct OrdersView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \CoffeeOrder.id) private var orders: [CoffeeOrder]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                if orders.isEmpty {
                    Text("No Orders")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    ForEach(orders) { order in
                        OrderCard(order: order)
                            .swipeActions {
                                Button(role: .destructive) {
                                    context.delete(order)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Orders")
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    NavigationStack {
        OrdersView()
            .modelContainer(for: CoffeeOrder.self, inMemory: true)
    }
}
