//
//  WeekendLogoView.swift
//  DrinkDash
//
//  Created by Z.K   on 16/09/2026.
//

import SwiftUI

struct WeekendLogoView: View {

    var body: some View {
        Text("Weekend")
            .font(AppTypography.weekend)
            .italic()
            .foregroundStyle(AppColors.primaryText)
            .accessibilityLabel("Weekend")
    }
}
