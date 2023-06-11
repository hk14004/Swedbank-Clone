//
//  ScreenCoordinatorAssembly.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 11/06/2023.
//

import Swinject
import DevToolsNavigation
import UIKit
import DevToolsCore

class ScreenCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // MARK: Login screen
        
        container.register((any LoginScreenVM).self.self) { (resolver) in
            return LoginScreenVMImpl(authProvider: resolver.resolve(AuthCredentialsProvider.self)!,
                                     sessionManager: resolver.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!)
        }
        container.register(LoginScreenVC.self.self) { (resolver) in
            return LoginScreenVC.instantiateViewController { coder in
                LoginScreenVC(coder: coder, viewModel: resolver.resolve((any LoginScreenVM).self)!)!
            }
        }
        
        // MARK: Language selection bottom screen
        
        container.register((any LanguageSelectionScreenBottomSheetVM).self) { (resolver) in
            return LanguageSelectionScreenBottomSheetVMImpl()
        }
        // View gets created manually
        
    }
    
}
