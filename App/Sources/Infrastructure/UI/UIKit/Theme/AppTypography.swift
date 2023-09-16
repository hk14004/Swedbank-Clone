//
//  Theme.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

enum AppTypography: DevTypography {
    case title
    case body
    case input
    
    var scaledFont: UIFont {
        switch self {
        case .body:
            return UIFontMetrics(forTextStyle: .body).scaledFont(for: .systemFont(ofSize: 12))
        case .title:
            return UIFontMetrics(forTextStyle: .title1).scaledFont(for: .boldSystemFont(ofSize: 12))
        case .input:
            return UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: 12))
        }
    }
}
