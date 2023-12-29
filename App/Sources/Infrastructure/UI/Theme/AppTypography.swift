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

enum AppTypography: DevTypography {
    case title
    case body
    case input
    
    var scaledFont: UIFont {
        switch self {
        case .body:
            return UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 16))
        case .title:
            return UIFontMetrics(forTextStyle: .title1).scaledFont(for: .boldSystemFont(ofSize: 16))
        case .input:
            return UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 16))
        }
    }
}
