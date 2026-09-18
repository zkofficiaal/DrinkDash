//
//  ProductDetailView.swift
//  DrinkDash
//
//  Created by Z.K  on 16/09/2026.
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

                detailContent

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

    // MARK: - Top Bar

    private var topBar: some View {

        HStack {

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
        }
    }

    // MARK: - Detail Content

    private var detailContent: some View {

        GeometryReader { geometry in

            HStack(
                alignment: .top,
                spacing: 0
            ) {

                leftContent
                    .frame(
                        width: geometry.size.width * 0.46,
                        alignment: .topLeading
                    )

                heroArea
                    .frame(
                        width: geometry.size.width * 0.54,
                        height: geometry.size.height * 0.78
                    )
            }
        }
    }

    // MARK: - Left Content

    private var leftContent: some View {

        VStack(
            alignment: .leading,
            spacing: 0
        ) {

            VStack(
                alignment: .leading,
                spacing: 6
            ) {

                Text(viewModel.product.name)
                    .font(AppTypography.productTitle)
                    .foregroundStyle(
                        AppColors.primaryText
                    )
                    .lineLimit(1)
                    .minimumScaleFactor(0.65)
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )

                Text(viewModel.product.description)
                    .font(AppTypography.subtitle)
                    .foregroundStyle(
                        AppColors.secondaryText
                    )
                    .multilineTextAlignment(.leading)
                    .frame(
                        maxWidth: 170,
                        alignment: .leading
                    )
            }
            .padding(.top, 12)

            VStack(
                alignment: .leading,
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
            .padding(.top, 40)
        }
    }

    // MARK: - Hero Area

    private var heroArea: some View {

        ProductImageView(
            product: viewModel.product
        )
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .scaleEffect(1.55)
        .offset(
            y: 45
        )
        .transition(
            .scale.combined(
                with: .opacity
            )
        )
    }

    // MARK: - Bottom Action

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

    // MARK: - Formatted Total

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
