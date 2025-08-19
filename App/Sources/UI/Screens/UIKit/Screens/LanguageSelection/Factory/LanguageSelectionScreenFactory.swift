//
//  LanguageSelectionScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine

protocol LanguageSelectionScreenFactory {
    func make(didSelectLanguageCodePublisher: PassthroughSubject<String, Never>) -> LanguageSelectionVC
}

class DefaultLanguageSelectionScreenFactory: LanguageSelectionScreenFactory {
    func make(didSelectLanguageCodePublisher: PassthroughSubject<String, Never>) -> LanguageSelectionVC {
        let vm = DefaultLanguageSelectionScreenVM(
            getCurrentLanguageUseCase: Composition.resolve(),
            getAvailableLanguagesUseCase: Composition.resolve(),
            setCurrentLanguagesUseCase: Composition.resolve()
        )
        let vc = LanguageSelectionVC(viewModel: vm)
        let router = DefaultLanguageSelectionRouter(
            viewController: vc,
            didSelectLanguageCodePublisher: didSelectLanguageCodePublisher
        )
        vm.router = router
        return vc
    }
}
