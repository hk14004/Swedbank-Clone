//
//  AppTypography.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

typealias Colors = SWEDBANKAsset.Colors

// TODO: Refactor to have this only return font
enum AppTypography: DevTypography {
    case title
    case title2
    case title3
    case body
    case input
    case link1
    
    var scaledFont: UIFont {
        switch self {
        case .body:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .title:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 16))
        case .title2:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16, weight: .medium))
        case .title3:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14))
        case .input:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .link1:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 18))
        }
    }
}
