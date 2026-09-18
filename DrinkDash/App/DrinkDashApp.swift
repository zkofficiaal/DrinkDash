//
//  DrinkDashApp.swift
//  DrinkDash
//
//  Created by Z.K   on 15/09/2026.
//

import SwiftUI

@main
struct DrinkDashApp: App {
    
    @State private var router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            AppRouterView()
                .environment(router)
        }
    }
}


