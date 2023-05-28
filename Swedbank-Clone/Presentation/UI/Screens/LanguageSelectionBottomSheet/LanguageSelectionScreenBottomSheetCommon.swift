//
//  LanguageSelectionScreenBottomSheetCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import Foundation
import DevToolsCore

class LanguageSelectionScreenBottomSheetVMNavigationBindings {
    var onClose: VoidCallback?
}

protocol LanguageSelectionScreenBottomSheetVM: ObservableObject {
    var navigationBindings: LanguageSelectionScreenBottomSheetVMNavigationBindings { get set }
    var selectedLanguage: String { get set }
    var availableLanguages: [String] { get set }
    
    func onClose()
    func onChangeLanguage(code: String)
}
