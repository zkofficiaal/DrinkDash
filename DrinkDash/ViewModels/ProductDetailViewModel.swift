//
//  ProductDetailViewModel.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import Observation
import SwiftUI

@Observable
final class ProductDetailViewModel {

    let product: Product

    var selectedSize: ProductSize

    var quantity: Int

    init(product: Product) {
        self.product = product
        self.selectedSize = product.defaultSize
        self.quantity = product.minimumQuantity
    }

    var unitPrice: Decimal {
        product.price(for: selectedSize)
    }

    var totalPrice: Decimal {
        unitPrice * Decimal(quantity)
    }

    func selectSize(_ size: ProductSize) {
        selectedSize = size
    }

    func increaseQuantity() {
        guard quantity < product.maximumQuantity else {
            return
        }

        quantity += 1
    }

    func decreaseQuantity() {
        guard quantity > product.minimumQuantity else {
            return
        }

        quantity -= 1
    }

    func createCartItem() -> CartItem {
        CartItem(
            product: product,
            size: selectedSize,
            quantity: quantity
        )
    }

    func createOrder() -> Order {
        Order(item: createCartItem())
    }
}
