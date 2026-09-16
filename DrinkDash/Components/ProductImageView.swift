//
//  ProductImageView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

struct ProductImageView: View {

    let product: Product

    var body: some View {
        Group {
            if UIImage(named: product.imageName) != nil {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
            } else {
                placeholder
            }
        }
        .accessibilityLabel(product.name)
    }

    private var placeholder: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.3))
                .frame(width: 180, height: 180)

            Image(systemName: "cup.and.saucer.fill")
                .font(.system(size: 70))
                .foregroundStyle(.white.opacity(0.75))
        }
    }
}
