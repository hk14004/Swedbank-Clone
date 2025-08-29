//
//  NetworkClientCredentialsPlugin.swift
//  SwedNetwork
//
//  Created by Hardijs on 19/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//

import Foundation
import DevToolsCore
import SwedApplication

public protocol NetworkClientCredentialsPlugin: UserSessionCredentialsStore where CredentialsType == UserSessionCredentials {}
