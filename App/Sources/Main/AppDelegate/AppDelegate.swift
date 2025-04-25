//
//  AppDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
import SwedApplicationBusinessRules

class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow? = Composition.resolve()
    
    // MARK: - LifeCycle
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startup()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        terminate()
    }
}
