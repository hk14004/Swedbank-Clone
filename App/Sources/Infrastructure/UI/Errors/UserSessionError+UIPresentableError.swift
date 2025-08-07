//
//  UserSessionError+UIPresentableError.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 10/06/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import DevToolsCore
import SwedApplicationBusinessRules

extension UserSessionError: @retroactive UIPresentableError {
    public var presentableContent: UIPresentableErrorContent {
        switch self {
        case .invalidLoginCredentials:
            UIPresentableErrorContent(
                title: AppStrings.Error.UserSession.InvalidLoginCredentials.title,
                message: AppStrings.Error.UserSession.InvalidLoginCredentials.message
            )
        case .missingCredentals:
            fallbackErrorContent
        case .expiredSession:
            UIPresentableErrorContent(
                title: AppStrings.Error.UserSession.ExpiredSession.title,
                message: AppStrings.Error.UserSession.ExpiredSession.message
            )
        }
    }
}
