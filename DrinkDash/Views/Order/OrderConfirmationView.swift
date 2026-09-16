//
//  OrderConfirmationView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

// MARK: - Order Confirmation View

struct OrderConfirmationView: View {

    @Environment(AppRouter.self) private var router

    @State private var viewModel: OrderViewModel

    init(order: Order) {
        _viewModel = State(
            initialValue: OrderViewModel(
                order: order
            )
        )
    }

    var body: some View {

        ZStack {

            AppColors.darkBackground
                .ignoresSafeArea()

            if viewModel.isReceiptVisible {

                ReceiptView(
                    order: viewModel.order,
                    viewModel: viewModel
                )
            }
        }
        .task {
            viewModel.startReceiptAnimation()
        }
        .onTapGesture {

            guard viewModel.isThankYouVisible else {
                return
            }

            withAnimation(AppMotion.screenTransition) {
                router.showHome()
            }
        }
    }
}
