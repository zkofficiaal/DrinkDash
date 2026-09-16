//
//  PreviewData.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

enum PreviewData {

    static let products: [Product] = [

        Product(
            name: "Cosmberry",
            subtitle: "$13.50 EACH",
            description: "Berry, creamy and refreshing.",
            imageName: "cosmberry",
            thumbnailImageName: "cosmberry",
            backgroundTop: Color(
                red: 0.73,
                green: 0.61,
                blue: 0.80
            ),
            backgroundBottom: Color(
                red: 0.87,
                green: 0.77,
                blue: 0.88
            ),
            basePrice: 13.50,
            promotionalText: "BUY 1 GET 1 FREE",
            sizePrices: [
                .small: 11.50,
                .medium: 13.50,
                .large: 15.50
            ]
        ),

        Product(
            name: "Banhoney",
            subtitle: "$14.50 EACH",
            description: "Sweet, smooth and golden.",
            imageName: "banhoney",
            thumbnailImageName: "banhoney",
            backgroundTop: Color(
                red: 0.96,
                green: 0.69,
                blue: 0.55
            ),
            backgroundBottom: Color(
                red: 0.98,
                green: 0.81,
                blue: 0.65
            ),
            basePrice: 14.50,
            promotionalText: "BUY 1 GET 1 FREE",
            sizePrices: [
                .small: 12.50,
                .medium: 14.50,
                .large: 16.50
            ]
        ),

        Product(
            name: "Chocoffee",
            subtitle: "$15.00 EACH",
            description: "Chocolate with a coffee finish.",
            imageName: "chocoffee",
            thumbnailImageName: "chocoffee",
            backgroundTop: Color(
                red: 0.86,
                green: 0.72,
                blue: 0.68
            ),
            backgroundBottom: Color(
                red: 0.94,
                green: 0.84,
                blue: 0.78
            ),
            basePrice: 15.00,
            promotionalText: "BUY 1 GET 1 FREE",
            sizePrices: [
                .small: 13.00,
                .medium: 15.00,
                .large: 17.00
            ]
        ),

        Product(
            name: "Minty Fresh",
            subtitle: "$13.00 EACH",
            description: "Cool, creamy and refreshing.",
            imageName: "mintyFresh",
            thumbnailImageName: "mintyFresh",
            backgroundTop: Color(
                red: 0.58,
                green: 0.82,
                blue: 0.72
            ),
            backgroundBottom: Color(
                red: 0.77,
                green: 0.91,
                blue: 0.82
            ),
            basePrice: 13.00,
            promotionalText: "BUY 1 GET 1 FREE",
            sizePrices: [
                .small: 11.00,
                .medium: 13.00,
                .large: 15.00
            ]
        ),

        Product(
            name: "Strawmilk",
            subtitle: "$14.00 EACH",
            description: "Creamy strawberry goodness.",
            imageName: "strawmilk",
            thumbnailImageName: "strawmilk",
            backgroundTop: Color(
                red: 0.93,
                green: 0.57,
                blue: 0.65
            ),
            backgroundBottom: Color(
                red: 0.98,
                green: 0.73,
                blue: 0.76
            ),
            basePrice: 14.00,
            promotionalText: "BUY 1 GET 1 FREE",
            sizePrices: [
                .small: 12.00,
                .medium: 14.00,
                .large: 16.00
            ]
        )
    ]
}
