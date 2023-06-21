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
        container.register(LoginScreenVC.self) { (resolver, viewModel: LoginScreenVM) in
            return LoginScreenVC.instantiateViewController { coder in
                LoginScreenVC(coder: coder, viewModel: viewModel)!
            }
        }
        
        container.register((any LanguageSelectionScreenBottomSheetVM).self) { (resolver) in
            return LanguageSelectionScreenBottomSheetVMImpl()
        }
        
        container.register((any OverviewScreenVM).self) { (resolver) in
            return OverviewScreenVMImpl()
        }
        container.register(OverviewScreenVC.self) { (resolver, viewModel: OverviewScreenVM) in
            return OverviewScreenVC(viewModel: viewModel)
        }
        
        container.register((any UserScreenVM).self) { (resolver) in
            return UserScreenVMImpl()
        }
        container.register(UserScreenVC.self) { (resolver, viewModel: UserScreenVM) in
            return UserScreenVC(viewModel: viewModel)
        }
        
        container.register((any SettingsScreenVM).self) { (resolver) in
            return SettingsScreenVMImpl()
        }
        container.register(SettingsScreenVC.self) { (resolver, viewModel: SettingsScreenVM) in
            return SettingsScreenVC(viewModel: viewModel)
        }
        
        container.register((any LanguageScreenVM).self) { (resolver) in
            return LanguageScreenVMImpl()
        }
        container.register(LanguageScreenVC.self) { (resolver, viewModel: LanguageScreenVM) in
            return LanguageScreenVC(viewModel: viewModel)
        }
    }
    
}
