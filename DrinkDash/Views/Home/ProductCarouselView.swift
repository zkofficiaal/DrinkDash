//
//  ProductCarouselView.swift
//  DrinkDash
//
//  Created by Z.K  on 16/09/2026.
//

import SwiftUI

// MARK: - Product Carousel View

struct ProductCarouselView: View {

    @Bindable var viewModel: HomeViewModel

    let screenSize: CGSize
    let onProductSelected: (Product) -> Void

    @State private var dragOffset: CGFloat = 0

    var body: some View {

        let product = viewModel.selectedProduct

        ZStack {

            if let product {

                let nextIndex =
                    (viewModel.selectedIndex + 1)
                    % viewModel.products.count

                let nextProduct =
                    viewModel.products[nextIndex]

                ProductHeroView(
                    product: product,
                    nextProduct: nextProduct,
                    screenSize: screenSize,
                    dragOffset: dragOffset
                ) {
                    onProductSelected(product)
                } onDrag: { value in
                    dragOffset = value.translation.width
                } onDragEnded: { value in

                    let threshold =
                        screenSize.width * 0.20

                    if value.translation.width < -threshold {

                        withAnimation(AppMotion.carousel) {
                            viewModel.moveToNext()
                            dragOffset = 0
                        }

                    } else if value.translation.width > threshold {

                        withAnimation(AppMotion.carousel) {
                            viewModel.moveToPrevious()
                            dragOffset = 0
                        }

                    } else {

                        withAnimation(AppMotion.carousel) {
                            dragOffset = 0
                        }
                    }
                }
            }
        }
    }
}
