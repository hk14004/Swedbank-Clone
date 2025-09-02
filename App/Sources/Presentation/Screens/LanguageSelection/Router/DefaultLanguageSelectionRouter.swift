//
//  DefaultLanguageSelectionRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import Combine
import DevToolsNavigation

class DefaultLanguageSelectionRouter: LanguageSelectionRouter {
    
    let viewController: UIViewController
    let didSelectLanguageCodePublisher: PassthroughSubject<String, Never>
    private var cancelBag: Set<AnyCancellable> = []
    
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

public protocol CancelBagStorable: AnyObject {
    var cancelBag: Set<AnyCancellable> { get set }
}

extension ToLanguageSelectionScreenRouting where Self: UIKitRouter, Self: CancelBagStorable {
    func routeToLanguageSelectionScreen() {
        let didSelectLanguagePublisher = PassthroughSubject<String, Never>()
        let factory: LanguageSelectionScreenFactory = Composition.resolve()
        let vc = factory.make(didSelectLanguageCodePublisher: didSelectLanguagePublisher)
        viewController?.present(vc, animated: true)
        didSelectLanguagePublisher.sink { [weak vc] _ in
            vc?.dismiss(animated: true)
        }
        .store(in: &cancelBag)
    }
}
