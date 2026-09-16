//
//  CartItem.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

//
//  CartItem.swift
//  ShoppingApp
//
//  Purpose: Defines a cart item model with product, size, quantity, and pricing logic.
//

import Foundation

// MARK: - CartItem Model
// Represents a single product entry in the shopping cart
struct CartItem: Identifiable, Equatable, Hashable {

    // MARK: Properties
    let id: UUID                     // Unique identifier for the cart item
    let product: Product             // The product being purchased
    let size: ProductSize            // Selected size/variant of the product
    let quantity: Int                // Number of units added to the cart

    // MARK: Computed Properties
    /// Price of one unit based on selected size
    var unitPrice: Decimal {
        product.price(for: size)
    }

    /// Total price for all units of this cart item
    var totalPrice: Decimal {
        unitPrice * Decimal(quantity)
    }

    // MARK: Initializer
    init(
        id: UUID = UUID(),
        product: Product,
        size: ProductSize,
        quantity: Int
    ) {
        self.id = id
        self.product = product
        self.size = size
        self.quantity = quantity
    }
}
