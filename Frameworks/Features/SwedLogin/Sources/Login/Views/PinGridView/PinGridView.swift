//
//  PinGrid.swift
//  App Unit Tests
//
//  Created by Hardijs Kirsis on 17/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwiftUI

struct PinGridView: View {
    
    var addDigit: @MainActor (Int) -> Void
    var removeDigit: @MainActor () -> Void
    var onFaceIDTapped: @MainActor () -> Void
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(78)), count: 3), spacing: 8) {
            ForEach(1...9, id: \.self) { number in
                PinDigitButton(
                    digit: number,
                    action: {
                        addDigit(number)
                    }
                )
            }
            // Biometric button
            Button(action: {
                onFaceIDTapped()
            }) {
                Image(systemName: "faceid")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(AppColors.accent3.swiftUIColor)
                    
            }
            // Zero button
            PinDigitButton(
                digit: 0,
                action: {
                    addDigit(0)
                }
            )
            // Backspace button
            Button(action: {
                removeDigit()
            }) {
                Image(systemName: "delete.left.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
                    .foregroundColor(AppColors.accent3.swiftUIColor)
            }
        }
    }
}

#Preview {
    PinGridView(
        addDigit: { _ in },
        removeDigit: {},
        onFaceIDTapped: {}
    )
}
