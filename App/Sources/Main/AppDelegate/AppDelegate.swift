//
//  AppDelegate.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
import SwedApplicationBusinessRules

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var saveAppLaunchDateUseCase: SaveAppLaunchDateUseCase = Composition.resolve()
    var saveAppTerminationDateUseCase: SaveAppTerminationDateUseCase = Composition.resolve()
    
    // MARK: - Lifecycle
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startup()
        return true
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        registerApplicationTermination()
    }
}
