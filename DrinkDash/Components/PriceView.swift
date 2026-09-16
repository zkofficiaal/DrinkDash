//
//  PriceView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

struct PriceView: View {

    let price: Decimal

    var prefix: String = ""

    var body: some View {
        Text("\(prefix)\(formattedPrice)")
            .font(AppTypography.price)
            .foregroundStyle(AppColors.primaryText)
    }

    private var formattedPrice: String {
        NSDecimalNumber(decimal: price)
            .doubleValue
            .formatted(
                .currency(code: "USD")
            )
    }
}
