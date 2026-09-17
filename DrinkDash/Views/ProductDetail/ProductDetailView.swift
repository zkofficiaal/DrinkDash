//
//  ProductDetailView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

// MARK: - Product Detail View

struct ProductDetailView: View {

    @Environment(AppRouter.self) private var router

    @State private var viewModel: ProductDetailViewModel

    @State private var isVisible = false

    init(product: Product) {
        _viewModel = State(
            initialValue: ProductDetailViewModel(
                product: product
            )
        )
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    viewModel.product.backgroundTop,
                    viewModel.product.backgroundBottom
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(
                spacing: 0
            ) {

                topBar

                heroArea

                controls

                Spacer()

                bottomAction
            }
            .padding(.horizontal, AppSpacing.horizontal)
            .padding(.top, 18)
            .padding(.bottom, AppSpacing.bottomButton)
        }
        .opacity(isVisible ? 1 : 0)
        .scaleEffect(isVisible ? 1 : 0.98)
        .onAppear {

            withAnimation(AppMotion.screenTransition) {
                isVisible = true
            }
        }
    }

    private var topBar: some View {

        HStack(
            alignment: .top
        ) {

            Button {

                withAnimation(AppMotion.screenTransition) {
                    router.showHome()
                }

            } label: {

                Image(
                    systemName: "chevron.left"
                )
                .font(
                    .system(
                        size: 18,
                        weight: .medium
                    )
                )
                .foregroundStyle(
                    AppColors.primaryText
                )
                .frame(
                    width: 44,
                    height: 44
                )
                .background(
                    .white.opacity(0.35)
                )
                .clipShape(Circle())
            }
            .buttonStyle(.plain)

            Spacer()

            VStack(
                alignment: .trailing,
                spacing: 4
            ) {

                Text(viewModel.product.name)
                    .font(AppTypography.productTitle)
                    .foregroundStyle(
                        AppColors.primaryText
                    )

                Text(viewModel.product.description)
                    .font(AppTypography.subtitle)
                    .foregroundStyle(
                        AppColors.secondaryText
                    )
                    .multilineTextAlignment(.trailing)
                    .frame(
                        maxWidth: 180
                    )
            }
        }
    }

    private var heroArea: some View {

        ProductImageView(
            product: viewModel.product
        )
        .frame(
            maxWidth: .infinity
        )
        .frame(
            height: 270
        )
        .transition(
            .scale.combined(
                with: .opacity
            )
        )
    }

    private var controls: some View {

        VStack(
            spacing: AppSpacing.large
        ) {

            SizeSelectorView(
                selectedSize: $viewModel.selectedSize
            )

            QuantitySelectorView(
                quantity: $viewModel.quantity,
                minimum: viewModel.product.minimumQuantity,
                maximum: viewModel.product.maximumQuantity
            )
        }
        .padding(.top, 4)
    }

    private var bottomAction: some View {

        VStack(
            spacing: 14
        ) {

            HStack {

                Text("TOTAL")
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(
                        AppColors.secondaryText
                    )

                Spacer()

                Text(
                    formattedTotal
                )
                .font(AppTypography.totalPrice)
                .foregroundStyle(
                    AppColors.primaryText
                )
                .contentTransition(
                    .numericText()
                )
                .animation(
                    AppMotion.price,
                    value: viewModel.totalPrice
                )
            }

            PrimaryButton(
                title: "Order Now"
            ) {

                let order = viewModel.createOrder()

                withAnimation(AppMotion.screenTransition) {
                    router.showReceipt(
                        for: order
                    )
                }
            }
        }
    }

    private var formattedTotal: String {

        NSDecimalNumber(
            decimal: viewModel.totalPrice
        )
        .doubleValue
        .formatted(
            .currency(
                code: "USD"
            )
        )
    }
}
