//
//  PinDigitButton.swift
//  App Unit Tests
//
//  Created by Hardijs Kirsis on 17/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwiftUI

struct PinDigitButton: View {
    var digit: Int
    var action: @MainActor () -> Void
    
    private static let buttonSize: CGFloat = 70
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text("\(digit)")
                .font(AppTypography.title6.scaledFontSwiftUI)
                .foregroundColor(AppColors.text1Inverse.swiftUIColor)
                .frame(width: Self.buttonSize, height: Self.buttonSize)
                .background(AppColors.accent3.swiftUIColor)
                .clipShape(Circle())
        }
    }
}

#Preview {
    PinDigitButton(digit: 2, action: {})
}
