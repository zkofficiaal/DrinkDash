//
//  HomeView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

// MARK: - Home View

struct HomeView: View {

    @Environment(AppRouter.self) private var router

    @State private var viewModel = HomeViewModel()

    var body: some View {
        GeometryReader { geometry in

            if let product = viewModel.selectedProduct {

                ZStack {

                    LinearGradient(
                        colors: [
                            product.backgroundTop,
                            product.backgroundBottom
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    ProductCarouselView(
                        viewModel: viewModel,
                        screenSize: geometry.size
                    ) { selectedProduct in

                        router.showProductDetail(
                            selectedProduct
                        )
                    }
                }
                .id(product.id)
                .transition(
                    .opacity
                )
            }
        }
    }
}
