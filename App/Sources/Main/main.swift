//
//  main.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import UIKit

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    delegateClassName()
)

private func delegateClassName() -> String? {
    if NSClassFromString("MyAppUITests") != nil { // UI Testing
        return NSStringFromClass(AppDelegate.self)
    } else if NSClassFromString("XCTestCase") != nil { // Unit Testing
        return nil
    } else { // App
        return NSStringFromClass(AppDelegate.self)
    }
}
