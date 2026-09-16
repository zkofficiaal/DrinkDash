//
//  Order.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import Foundation

struct Order: Identifiable, Equatable, Hashable {

    let id: UUID
    let item: CartItem
    let createdAt: Date

    var total: Decimal {
        item.totalPrice
    }

    init(
        id: UUID = UUID(),
        item: CartItem,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.item = item
        self.createdAt = createdAt
    }
}
