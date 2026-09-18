//
//  ReceiptView.swift
//  DrinkDash
//
//  Created by Z.K  on 16/09/2026.
//

import SwiftUI

// MARK: - Receipt View

struct ReceiptView: View {

    @Environment(AppRouter.self) private var router

    let order: Order

    @Bindable var viewModel: OrderViewModel

    var body: some View {

        GeometryReader { geometry in

            VStack {

                ZStack {

                    ReceiptShape(
                        toothWidth: 12,
                        toothHeight: 8
                    )
                    .fill(
                        AppColors.receiptPaper
                    )
                    .frame(
                        width: min(
                            geometry.size.width * 0.68,
                            300
                        ),
                        height: min(
                            geometry.size.height * 0.66,
                            530
                        )
                    )
                    .shadow(
                        color: .black.opacity(0.25),
                        radius: 20,
                        y: 10
                    )
                    .scaleEffect(
                        viewModel.isReceiptVisible
                        ? 1
                        : 0.8
                    )
                    .opacity(
                        viewModel.isReceiptVisible
                        ? 1
                        : 0
                    )

                    receiptContent
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            }
        }
    }

    // MARK: - Receipt Content

    private var receiptContent: some View {

        VStack(
            spacing: 0
        ) {

            Spacer(
                minLength: 20
            )

            if viewModel.isHeaderVisible {

                Text("RECEIPT")
                    .font(
                        AppTypography.receiptTitle
                    )
                    .foregroundStyle(
                        .white
                    )
                    .transition(
                        .move(
                            edge: .bottom
                        )
                        .combined(
                            with: .opacity
                        )
                    )
            }

            Spacer(
                minLength: 16
            )

            if viewModel.isProductVisible {

                Text(order.item.product.name)
                    .font(
                        AppTypography.receiptTitle
                    )
                    .foregroundStyle(
                        AppColors.primaryText
                    )
                    .transition(
                        .move(
                            edge: .bottom
                        )
                        .combined(
                            with: .opacity
                        )
                    )
            }

            Spacer(
                minLength: 16
            )

            if viewModel.isDetailsVisible {

                VStack(
                    spacing: 10
                ) {

                    receiptRow(
                        title: "SIZE",
                        value: order.item.size.rawValue
                    )

                    receiptRow(
                        title: "QUANTITY",
                        value: "\(order.item.quantity)"
                    )

                    receiptRow(
                        title: "PRICE",
                        value: formatted(
                            order.item.unitPrice
                        )
                    )
                }
                .transition(
                    .opacity.combined(
                        with: .move(
                            edge: .bottom
                        )
                    )
                )
            }

            Spacer(
                minLength: 18
            )

            if viewModel.isTotalVisible {

                VStack(
                    spacing: 5
                ) {

                    Text("TOTAL")
                        .font(
                            AppTypography.sectionLabel
                        )
                        .foregroundStyle(
                            AppColors.secondaryText
                        )

                    Text(
                        formatted(
                            order.total
                        )
                    )
                    .font(
                        AppTypography.totalPrice
                    )
                    .foregroundStyle(
                        AppColors.primaryText
                    )
                    .padding(12)

                    Text("Developed by:")
                        .font(
                            AppTypography.subtitle
                        )

                    Text("DevTechZahid")
                        .font(
                            AppTypography.devtechzahidTitle
                        )
                }
                .transition(
                    .scale.combined(
                        with: .opacity
                    )
                )
            }

            Spacer(
                minLength: 18
            )

//            if viewModel.isThankYouVisible {
//
//                Text("Thank you")
//                    .font(
//                        AppTypography.receiptBody
//                    )
//                    .foregroundStyle(
//                        .white
//                    )
//                    .transition(
//                        .scale.combined(
//                            with: .opacity
//                        )
//                    )
//            }
//
//            Spacer(
//                minLength: 18
//            )

           
            // MARK: - Place Another Order

            if viewModel.isThankYouVisible {
                PrimaryButton(
                    title: "Place Another Order"
                ) {
                    withAnimation(
                        AppMotion.screenTransition
                    ) {
                        router.showHome()
                    }
                }
                .transition(
                    .move(
                        edge: .bottom
                    )
                    .combined(
                        with: .opacity
                    )
                )
            }
            

            Spacer(
                minLength: 28
            )
        }
        .frame(
            width: 210
        )
        .animation(
            AppMotion.standard,
            value: viewModel.isHeaderVisible
        )
        .animation(
            AppMotion.standard,
            value: viewModel.isProductVisible
        )
        .animation(
            AppMotion.standard,
            value: viewModel.isDetailsVisible
        )
        .animation(
            AppMotion.standard,
            value: viewModel.isTotalVisible
        )
        .animation(
            AppMotion.standard,
            value: viewModel.isThankYouVisible
        )
    }

    // MARK: - Receipt Row

    private func receiptRow(
        title: String,
        value: String
    ) -> some View {

        HStack {

            Text(title)
                .font(
                    AppTypography.sectionLabel
                )
                .foregroundStyle(
                    AppColors.secondaryText
                )

            Spacer()

            Text(value)
                .font(
                    AppTypography.receiptBody
                )
                .foregroundStyle(
                    AppColors.primaryText
                )
        }
    }

    // MARK: - Currency Formatting

    private func formatted(
        _ value: Decimal
    ) -> String {

        NSDecimalNumber(
            decimal: value
        )
        .doubleValue
        .formatted(
            .currency(
                code: "USD"
            )
        )
    }
}
