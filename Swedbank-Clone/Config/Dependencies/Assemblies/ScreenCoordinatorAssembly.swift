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
        container.register((any LoginScreenVM).self) { (resolver) in
            return LoginScreenVMImpl(authProvider: resolver.resolve(AuthCredentialsProvider.self)!,
                                     sessionManager: resolver.resolve(BaseUserSessionManager<SwedbankUserSessionCredentials>.self)!)
        }
        container.register(LoginScreenVC.self) { (resolver) in
            return LoginScreenVC.instantiateViewController { coder in
                LoginScreenVC(coder: coder, viewModel: resolver.resolve((any LoginScreenVM).self)!)!
            }
        }
        
        container.register((any LanguageSelectionScreenBottomSheetVM).self) { (resolver) in
            return LanguageSelectionScreenBottomSheetVMImpl()
        }
        
        container.register((any OverviewScreenVM).self) { (resolver) in
            return OverviewScreenVMImpl()
        }
        container.register(OverviewScreenVC.self) { (resolver) in
            return OverviewScreenVC(viewModel: resolver.resolve((any OverviewScreenVM).self)!)
        }
    }
    
}
