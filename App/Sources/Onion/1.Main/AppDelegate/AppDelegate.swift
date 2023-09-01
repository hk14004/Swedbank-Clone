//
//  AppDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    private let composition = Composition()
    var window: UIWindow?
    
    // MARK: - Lifecycle
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startup()
        return true
    }
}

// MARK: Private
extension AppDelegate {
    private func startup() {
        configureWindow()
    }
    
    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = composition.container.resolve((any SplashScreenFactory).self)!.make()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
}
