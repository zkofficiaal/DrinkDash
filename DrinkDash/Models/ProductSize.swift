//
//  ProductSize.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import Foundation

enum ProductSize: String, CaseIterable, Identifiable, Codable {

    case small = "S"
    case medium = "M"
    case large = "L"

    var id: String {
        rawValue
    }

    var displayName: String {
        rawValue
    }
}
