//
//  Colors.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI

enum AppColorNames: String {
    case color1
}

extension AppColorNames {
    func getColor() -> Color {
        return Color(self.rawValue)
    }
}
