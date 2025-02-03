//
//  ContentView.swift
//  iOSApp2
//
//  Created by Tassos Fergadiotis on 2025-02-02.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    NavigationLink(destination: CoffeeOrderView()) {
                        HStack {
                            Image(systemName: "cup.and.saucer.fill")
                            Text("Press for COFFEE")
                        }
                        .font(.title2.weight(.semibold))
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.brown)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: CoffeeOrder.self, inMemory: true)
}
