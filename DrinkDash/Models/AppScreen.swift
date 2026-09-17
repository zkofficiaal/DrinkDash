//
//  AppScreen.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

//enum AppScreen: Equatable {
//
//    case home
//    case productDetail(Product)
//    case receipt(Order)
//}

import Foundation

enum AppScreen: Equatable {

    case home
    case productDetail(Product)
    case receipt(Order)

    static func == (lhs: AppScreen, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {

        case (.home, .home):
            return true

        case (.productDetail(let lhsProduct), .productDetail(let rhsProduct)):
            return lhsProduct.id == rhsProduct.id

        case (.receipt(let lhsOrder), .receipt(let rhsOrder)):
            return lhsOrder.id == rhsOrder.id

        default:
            return false
        }
    }
}
