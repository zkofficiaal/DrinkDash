//
//  HomeViewModel.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import Observation

@Observable
final class HomeViewModel {

    let products: [Product]

    var selectedIndex: Int = 0

    init(products: [Product] = PreviewData.products) {
        self.products = products
    }

    var selectedProduct: Product? {
        guard products.indices.contains(selectedIndex) else {
            return nil
        }

        return products[selectedIndex]
    }

    func moveToNext() {
        guard !products.isEmpty else {
            return
        }

        selectedIndex = (selectedIndex + 1) % products.count
    }

    func moveToPrevious() {
        guard !products.isEmpty else {
            return
        }

        selectedIndex =
            (selectedIndex - 1 + products.count) % products.count
    }

    func move(by offset: Int) {
        guard !products.isEmpty else {
            return
        }

        let newIndex = selectedIndex + offset

        if newIndex < 0 {
            selectedIndex = products.count - 1
        } else if newIndex >= products.count {
            selectedIndex = 0
        } else {
            selectedIndex = newIndex
        }
    }
}
