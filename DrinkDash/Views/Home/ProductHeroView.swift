//
//  ProductHeroView.swift
//  DrinkDash
//
//  Created by Z.K  on 16/09/2026.
//

import SwiftUI

// MARK: - Product Hero View

struct ProductHeroView: View {

    let product: Product
    let nextProduct: Product
    let screenSize: CGSize
    let dragOffset: CGFloat
    let onSelect: () -> Void

    var body: some View {

        VStack(spacing: 0) {

            header

            Spacer(
                minLength: 0
            )

            heroImage

            Spacer(
                minLength: 0
            )

            bottomContent
        }
        .padding(.horizontal, AppSpacing.horizontal)
        .padding(.top, AppSpacing.heroTop)
        .padding(.bottom, AppSpacing.bottomButton)
    }

    private var header: some View {

        HStack {

            WeekendLogoView()

            Spacer()

            thumbnail
        }
    }

    private var thumbnail: some View {

        Button(action: onSelect) {

            ZStack {

                Circle()
                    .fill(.white.opacity(0.35))
                    .frame(
                        width: 58,
                        height: 58
                    )

                ProductImageView(
                    product: nextProduct
                )
                .frame(
                    width: 50,
                    height: 50
                )
            }
        }
        .buttonStyle(.plain)
    }

    private var heroImage: some View {

        ProductImageView(
            product: product
        )
        .frame(
            width: screenSize.width * 0.82,
            height: screenSize.height * 0.52
        )
        .scaleEffect(
            1.0 + min(abs(dragOffset) / 2000, 0.04)
        )
        .offset(
            x: dragOffset * 0.72
        )
        .opacity(
            1.0 - min(abs(dragOffset) / 1200, 0.20)
        )
        .animation(
            AppMotion.productImage,
            value: dragOffset
        )
    }

    private var bottomContent: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {

            HStack(
                alignment: .bottom
            ) {

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {

                    Text(product.name)
                        .font(AppTypography.heroTitle)
                        .foregroundStyle(
                            AppColors.primaryText
                        )

                    Text(product.subtitle)
                        .font(AppTypography.subtitle)
                        .foregroundStyle(
                            AppColors.secondaryText
                        )

                    PriceView(
                        price: product.basePrice,
                        prefix: "$"
                    )
                }

                Spacer()
            }

            Button(action: onSelect) {

                Text(product.promotionalText)
                    .font(AppTypography.sectionLabel)
                    .foregroundStyle(
                        AppColors.primaryText
                    )
                    .padding(
                        .horizontal,
                        16
                    )
                    .padding(
                        .vertical,
                        10
                    )
                    .background(
                        .white.opacity(0.45)
                    )
                    .clipShape(
                        Capsule()
                    )
            }
            .buttonStyle(.plain)
        }
    }
}
