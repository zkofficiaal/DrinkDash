//
//  QuantitySelectorView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

// MARK: - Quantity Selector View

struct QuantitySelectorView: View {

    @Binding var quantity: Int

    let minimum: Int
    let maximum: Int

    var body: some View {

        HStack(spacing: 18) {

            controlButton(
                systemName: "minus",
                isEnabled: quantity > minimum
            ) {

                guard quantity > minimum else {
                    return
                }

                withAnimation(AppMotion.control) {
                    quantity -= 1
                }
            }

            Text("\(quantity)")
                .font(
                    .system(
                        size: 18,
                        weight: .semibold,
                        design: .rounded
                    )
                )
                .foregroundStyle(
                    AppColors.primaryText
                )
                .frame(
                    minWidth: 28
                )
                .contentTransition(
                    .numericText()
                )
                .animation(
                    AppMotion.price,
                    value: quantity
                )

            controlButton(
                systemName: "plus",
                isEnabled: quantity < maximum
            ) {

                guard quantity < maximum else {
                    return
                }

                withAnimation(AppMotion.control) {
                    quantity += 1
                }
            }
        }
        .padding(
            .horizontal,
            12
        )
        .padding(
            .vertical,
            8
        )
        .background(
            .white.opacity(0.42)
        )
        .clipShape(
            Capsule()
        )
    }

    private func controlButton(
        systemName: String,
        isEnabled: Bool,
        action: @escaping () -> Void
    ) -> some View {

        Button(
            action: action
        ) {

            Image(
                systemName: systemName
            )
            .font(
                .system(
                    size: 13,
                    weight: .bold
                )
            )
            .foregroundStyle(
                isEnabled
                ? AppColors.primaryText
                : AppColors.secondaryText.opacity(0.35)
            )
            .frame(
                width: 34,
                height: 34
            )
            .background(
                .white.opacity(
                    isEnabled ? 0.6 : 0.25
                )
            )
            .clipShape(Circle())
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }
}
