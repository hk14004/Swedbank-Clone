//
//  LockedTabScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 27/05/2023.
//

import Foundation
import DevToolsCore

class LockedTabScreenVMNavigationBindings {
    var onGoToLogin: VoidCallback?
}

protocol LockedTabScreenVM: ObservableObject {
    var tabDescriptionIconName: String { get }
    var title: String { get }
    var subtitle: String { get }
    var backgroundColorName: String { get }
    var navigationBindings: LockedTabScreenVMNavigationBindings { get set }
    
    func onAuthTapped()
}
