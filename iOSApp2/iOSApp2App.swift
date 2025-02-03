//
//  iOSApp2App.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import SwiftUI
import SwiftData

@main
struct CoffeeOrder2App: App {
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([CoffeeOrder.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: modelConfiguration)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
