import Foundation
import DevToolsNetworking
import SwedApplicationBusinessRules

enum SessionRequestConfig {
    case startSession(StartSessionDataOutgoing)
    case refreshToken(RefreshSessionServiceInput)
    case checkSession
}

extension SessionRequestConfig: DevRequestConfig {
    var baseURL: String {
        "https://dummyjson.com"
    }
    
    var path: String {
        switch self {
        case .startSession:
            "/auth/login"
        case .refreshToken:
            "/auth/refresh"
        case .checkSession:
            "/auth/me"
        }
    }
    
    var method: DevHTTPMethod {
        switch self {
        case .startSession, .refreshToken:
            .post
        case .checkSession:
            .get
        }
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var bodyParameters: Data? {
        switch self {
        case .startSession(let credentials):
            try? JSONEncoder().encode(credentials)
        case .refreshToken(let credentials):
            try? JSONEncoder().encode(credentials)
        case .checkSession:
            nil
        }
    }
    
    var requiresAuthorization: Bool {
        switch self {
        case .startSession:
            true
        case .refreshToken:
            false
        case .checkSession:
            true
        }
    }
}
