//
//  AppTypography.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import SwiftUI
import DevToolsUI

public enum AppTypography: DevTypography {
    case title
    case title2
    case title3
    case title4
    case title5
    case title6
    case title7
    case body
    case input
    case link1
    
    public var scaledFont: UIFont {
        switch self {
        case .body:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .title:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 16))
        case .title2:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16, weight: .medium))
        case .title3:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 14))
        case .title4:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 11))
        case .title5:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 12))
        case .title6:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 22))
        case .title7:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 30))
        case .input:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .link1:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 18))
        }
    }
    
    public var scaledFontSwiftUI: Font {
        Font(scaledFont)
    }
}
