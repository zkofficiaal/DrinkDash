//
//  AppRouter.swift
//  DrinkDash
//
//  Created by Z.K   on 15/09/2026.
//

import SwiftUI
import Observation

@Observable
final class AppRouter {

    var screen: AppScreen = .home

    private(set) var selectedProduct: Product?

    private(set) var currentOrder: Order?

    // Opens the selected product detail screen.
    func showProductDetail(_ product: Product) {
        selectedProduct = product
        screen = .productDetail(product)
    }

    // Creates an order and moves to the confirmation experience.
    func showReceipt(for order: Order) {
        currentOrder = order
        screen = .receipt(order)
    }

    // Returns to the home carousel.
    func showHome() {
        screen = .home
    }

    // Resets the application state.
    func reset() {
        selectedProduct = nil
        currentOrder = nil
        screen = .home
    }
}

// Root state-driven view.
struct AppRouterView: View {

    @Environment(AppRouter.self) private var router

    var body: some View {
        Group {
            switch router.screen {
            case .home:
                HomeView()

            case .productDetail(let product):
                ProductDetailView(product: product)

            case .receipt(let order):
                OrderConfirmationView(order: order)
            }
        }
        .animation(AppMotion.screenTransition, value: router.screen)
    }
}
