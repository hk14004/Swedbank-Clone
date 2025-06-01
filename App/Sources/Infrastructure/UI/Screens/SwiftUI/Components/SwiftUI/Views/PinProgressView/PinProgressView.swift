//
//  PinProgressView.swift
//  App Unit Tests
//
//  Created by Hardijs Kirsis on 17/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import SwiftUI

struct PinProgressView: View {
    var maxPinLength: Int
    @Binding var currentPin: String
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<maxPinLength, id: \.self) { index in
                Circle()
                    .stroke(lineWidth: 1)
                    .foregroundStyle(AppColors.text2.swiftUIColor)
                    .frame(width: 10, height: 10)
                    .overlay(
                        Circle()
                            .fill(
                                index < currentPin.count
                                ? AppColors.text2.swiftUIColor
                                : Color.clear
                            )
                            
                    )
            }
        }
    }
}

#Preview {
    PinProgressView(maxPinLength: 4, currentPin: Binding<String>(get: { "12" }, set: { _ in }))
}
