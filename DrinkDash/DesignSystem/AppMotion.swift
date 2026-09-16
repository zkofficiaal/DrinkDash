//
//  AppMotion.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

enum AppMotion {

    static let fast = Animation.easeOut(duration: 0.2)

    static let standard = Animation.easeInOut(duration: 0.38)

    static let slow = Animation.easeInOut(duration: 0.65)

    static let carousel = Animation.easeInOut(duration: 0.58)

    static let productImage = Animation.spring(
        response: 0.58,
        dampingFraction: 0.86
    )

    static let control = Animation.spring(
        response: 0.28,
        dampingFraction: 0.78
    )

    static let price = Animation.easeOut(duration: 0.25)

    static let receipt = Animation.easeOut(duration: 0.75)

    static let screenTransition = Animation.easeInOut(duration: 0.55)

    static let stagger: Double = 0.08
}
