//
//  SizeSelectorView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

// MARK: - Size Selector View

struct SizeSelectorView: View {

    @Binding var selectedSize: ProductSize

    var body: some View {

        HStack(spacing: 8) {

            ForEach(ProductSize.allCases) { size in

                Button {

                    withAnimation(AppMotion.control) {
                        selectedSize = size
                    }

                } label: {

                    Text(size.displayName)
                        .font(
                            .system(
                                size: 14,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(
                            selectedSize == size
                            ? .white
                            : AppColors.primaryText
                        )
                        .frame(
                            width: 52,
                            height: 42
                        )
                        .background(
                            selectedSize == size
                            ? AppColors.controlSelected
                            : AppColors.controlBackground
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: AppRadius.small,
                                style: .continuous
                            )
                        )
                        .scaleEffect(
                            selectedSize == size
                            ? 1.04
                            : 1.0
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Drink size")
    }
}
