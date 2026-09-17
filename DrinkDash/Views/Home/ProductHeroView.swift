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

        GeometryReader { geometry in

            VStack(spacing: 0) {

                header
                    .frame(
                        height: geometry.size.height * 0.15,
                        alignment: .top
                    )

                heroImage
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height * 0.55
                    )

                bottomContent
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height * 0.30,
                        alignment: .top
                    )
            }
        }
        .padding(.horizontal, AppSpacing.horizontal)
        .padding(.top, AppSpacing.logoTop)
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
            alignment: .center,
            spacing: AppSpacing.medium
        ) {

            VStack(
                alignment: .center,
                spacing: 4
            ) {

                Text(product.name)
                    .font(AppTypography.heroTitle)
                    .foregroundStyle(
                        AppColors.primaryText
                    )
                
               // Spacer()
                    .padding(5)

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

                .padding(15)
            
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
        .frame(
            maxWidth: .infinity,
            alignment: .center
        )
    }
}
