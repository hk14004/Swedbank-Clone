//
//  AssetColor.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import SwiftUI

enum AssetColor: String {
    case color1
}

extension AssetColor {
    func getColor() -> Color {
        return Color(self.rawValue)
    }
    
    func getUIColor() -> UIColor {
        return UIColor(named: self.rawValue)!
    }
}
