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
            return UIPresentableErrorContent(
                title: AppStrings.Error.UserSession.InvalidLoginCredentials.title,
                message: AppStrings.Error.UserSession.InvalidLoginCredentials.message
            )
        }
    }
}
