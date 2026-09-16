//
//  Product.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

struct Product: Identifiable, Equatable, Hashable {

    let id: UUID
    let name: String
    let subtitle: String
    let description: String

    let imageName: String
    let thumbnailImageName: String

    let backgroundTop: Color
    let backgroundBottom: Color

    let basePrice: Decimal

    let promotionalText: String

    let sizePrices: [ProductSize: Decimal]

    let defaultSize: ProductSize

    let minimumQuantity: Int
    let maximumQuantity: Int

    init(
        id: UUID = UUID(),
        name: String,
        subtitle: String,
        description: String,
        imageName: String,
        thumbnailImageName: String,
        backgroundTop: Color,
        backgroundBottom: Color,
        basePrice: Decimal,
        promotionalText: String,
        sizePrices: [ProductSize: Decimal],
        defaultSize: ProductSize = .medium,
        minimumQuantity: Int = 1,
        maximumQuantity: Int = 10
    ) {
        self.id = id
        self.name = name
        self.subtitle = subtitle
        self.description = description
        self.imageName = imageName
        self.thumbnailImageName = thumbnailImageName
        self.backgroundTop = backgroundTop
        self.backgroundBottom = backgroundBottom
        self.basePrice = basePrice
        self.promotionalText = promotionalText
        self.sizePrices = sizePrices
        self.defaultSize = defaultSize
        self.minimumQuantity = minimumQuantity
        self.maximumQuantity = maximumQuantity
    }

    func price(for size: ProductSize) -> Decimal {
        sizePrices[size] ?? basePrice
    }
}
