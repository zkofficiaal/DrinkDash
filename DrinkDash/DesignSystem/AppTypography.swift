//
//  AppTypography.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

enum AppTypography {

    static let weekend = Font.system(
        size: 32,
        weight: .medium,
        design: .serif
    )

    static let heroTitle = Font.system(
        size: 48,
        weight: .medium,
        design: .serif
    )

    static let productTitle = Font.system(
        size: 34,
        weight: .medium,
        design: .serif
    )

    static let subtitle = Font.system(
        size: 14,
        weight: .regular,
        design: .rounded
    )

    static let sectionLabel = Font.system(
        size: 11,
        weight: .semibold,
        design: .rounded
    )

    static let price = Font.system(
        size: 15,
        weight: .semibold,
        design: .rounded
    )

    static let totalPrice = Font.system(
        size: 30,
        weight: .semibold,
        design: .rounded
    )

    static let button = Font.system(
        size: 16,
        weight: .semibold,
        design: .rounded
    )

    static let receiptTitle = Font.system(
        size: 22,
        weight: .semibold,
        design: .serif
    )

    static let receiptBody = Font.system(
        size: 13,
        weight: .regular,
        design: .rounded
    )
}
