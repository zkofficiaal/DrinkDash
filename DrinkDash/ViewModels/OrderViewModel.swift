//
//  OrderViewModel.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import Observation

@Observable
final class OrderViewModel {

    let order: Order

    var isReceiptVisible = false
    var isHeaderVisible = false
    var isProductVisible = false
    var isDetailsVisible = false
    var isTotalVisible = false
    var isThankYouVisible = false

    init(order: Order) {
        self.order = order
    }

    func startReceiptAnimation() {

        isReceiptVisible = true

        Task { @MainActor in

            try? await Task.sleep(
                nanoseconds: 250_000_000
            )

            isHeaderVisible = true

            try? await Task.sleep(
                nanoseconds: 100_000_000
            )

            isProductVisible = true

            try? await Task.sleep(
                nanoseconds: 100_000_000
            )

            isDetailsVisible = true

            try? await Task.sleep(
                nanoseconds: 120_000_000
            )

            isTotalVisible = true

            try? await Task.sleep(
                nanoseconds: 150_000_000
            )

            isThankYouVisible = true
        }
    }

    func reset() {
        isReceiptVisible = false
        isHeaderVisible = false
        isProductVisible = false
        isDetailsVisible = false
        isTotalVisible = false
        isThankYouVisible = false
    }
}
