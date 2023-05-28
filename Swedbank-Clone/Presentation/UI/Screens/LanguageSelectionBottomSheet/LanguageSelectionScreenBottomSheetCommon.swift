//
//  LanguageSelectionScreenBottomSheetCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 28/05/2023.
//

import Foundation

protocol LanguageSelectionScreenBottomSheetVM: ObservableObject {
    var selectedLanguage: String { get set }
    var availableLanguages: [String] { get set }
    
    func onClose()
    func onChangeLanguage(code: String)
}
