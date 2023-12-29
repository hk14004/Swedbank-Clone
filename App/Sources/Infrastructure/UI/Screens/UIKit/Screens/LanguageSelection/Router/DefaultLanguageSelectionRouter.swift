//
//  DefaultLanguageSelectionRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import SwedInterfaceAdapters
import Combine

class DefaultLanguageSelectionRouter: LanguageSelectionRouter {
    
    let viewController: UIViewController
    let didSelectLanguageCodePublisher: PassthroughSubject<String, Never>
    
    init(
        viewController: UIViewController,
        didSelectLanguageCodePublisher: PassthroughSubject<String, Never>
    ) {
        self.viewController = viewController
        self.didSelectLanguageCodePublisher = didSelectLanguageCodePublisher
    }
    
    func selectedLanguage(code: String) {
        didSelectLanguageCodePublisher.send(code)
    }
}
