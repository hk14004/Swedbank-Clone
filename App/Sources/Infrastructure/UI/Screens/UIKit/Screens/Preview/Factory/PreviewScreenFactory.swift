//
//  PreviewScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 29/04/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine

protocol PreviewScreenFactory {
    func make() -> PreviewScreenVC
}

class DefaultPreviewScreenFactory: PreviewScreenFactory {
    func make() -> PreviewScreenVC {
        let previewView = UIButton(type: .system)
        let vc = PreviewScreenVC(
            previewView: previewView,
            layout: .center
        )
        return vc
    }
}
