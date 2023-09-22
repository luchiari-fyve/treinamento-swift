//
//  treinamento_swiftApp.swift
//  treinamento-swift
//
//  Created by Laura Ranucci Luchiari on 12/09/23.
//

import SwiftUI

@main
struct treinamento_swiftApp: App {
    @StateObject var cartData = CartData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartData)
        }
    }
}
