//
//  BiometryError+UIPresentableError.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 25/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsCore
import Application

extension BiometryError: @retroactive UIPresentableError {
    public var presentableContent: UIPresentableErrorContent {
        switch self {
        case .biometryNotAvailable:
            UIPresentableErrorContent(
                title: AppStrings.Error.Generic.title,
                message: AppStrings.Error.Biometry.BiometryNotAvailable.message
            )
        case .underlyingError(let systemError):
            switch systemError.code {
            case .authenticationFailed:
                loginError
            case .biometryLockout:
                loginError
            case .userFallback:
                UIPresentableErrorContent(
                    title: AppStrings.Error.Generic.title,
                    message: AppStrings.Error.Biometry.UserFallback.message
                )
            default:
                fallbackErrorContent
            }
        }
    }
    
    fileprivate var loginError: UIPresentableErrorContent {
        UIPresentableErrorContent(
            title: AppStrings.Error.Generic.title,
            message: AppStrings.Error.UserSession.InvalidLoginCredentials.message
        )
    }
}
