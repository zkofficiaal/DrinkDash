//
//  ReceiptShape.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

struct ReceiptShape: Shape {

    let toothWidth: CGFloat
    let toothHeight: CGFloat

    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.minY
            )
        )

        path.addLine(
            to: CGPoint(
                x: rect.maxX,
                y: rect.maxY - toothHeight
            )
        )

        var x = rect.maxX

        var down = true

        while x > rect.minX {

            x -= toothWidth

            let y = down
                ? rect.maxY
                : rect.maxY - toothHeight

            path.addLine(
                to: CGPoint(
                    x: max(x, rect.minX),
                    y: y
                )
            )

            down.toggle()
        }

        path.addLine(
            to: CGPoint(
                x: rect.minX,
                y: rect.minY
            )
        )

        path.closeSubpath()

        return path
    }
}
