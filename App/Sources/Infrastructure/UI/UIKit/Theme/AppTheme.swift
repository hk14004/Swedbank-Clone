//
//  AppTheme.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsUI

typealias Colors = SWEDBANKAsset.Colors

struct AppTheme: DevTheme {
    
    static var roundedCornerRadius: CGFloat = 16
    
    static var contentColor: UIColor = Colors.content1.color
    
    static var backgroundColor: UIColor = Colors.background1.color
    
    static var uIControlColor: UIColor = Colors.orange1.color
    
    static var textColor: UIColor = Colors.text1.color
    
    static var secondaryTextColor: UIColor = Colors.text1.color
    
    static var placeHolderTextColor: UIColor = Colors.text1.color
    
    static var textLinkColor: UIColor = Colors.blue1.color
    
}
