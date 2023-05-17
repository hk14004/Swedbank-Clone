//
//  WelcomeScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import Combine

protocol WelcomeScreenVMNavigationDelegate: AnyObject {
    func onNavigationEvent(_ event: WelcomeScreenVMNavigationEvent)
}

enum WelcomeScreenVMNavigationEvent: CaseIterable {
    case alreadyCustomerTapped
    case becomeCustomerTapped
}

protocol WelcomeScreenVM: ObservableObject {
    var navigationDelegate: WelcomeScreenVMNavigationDelegate? { get set }
    func onAlreadyCustomerTapped()
    func onBecomeACustomerTapped()
}


//
//protocol BaseScreenViewModel: ObservableObject {
//    associatedtype NavigationDelegateType: BaseViewModelNavigationDelegate
//    var navigationDelegate: NavigationDelegateType? { get set }
//}
//
//protocol BaseViewModelNavigationDelegate: AnyObject {
//    associatedtype NavigationEvent: CaseIterable
//
//    func onNavigationEvent(_ event: NavigationEvent)
//}
//
//class PreviewNavigationDelegate: BaseViewModelNavigationDelegate {
//
//    typealias NavigationEvent = PreviewNavigationEvent
//
//    enum PreviewNavigationEvent: CaseIterable {
//        case previewEvent
//    }
//
//    func onNavigationEvent(_ event: PreviewNavigationEvent) {
//
//    }
//
//}
