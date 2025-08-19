import Foundation
import DevToolsNetworking
import SwedApplication

enum SessionRequestConfig {
    case startSession(StartSessionDataOutgoing)
    case refreshToken(RefreshSessionServiceInput)
}

struct RefreshSessionServiceInput: Codable {
    public let refreshToken: String
    
    public init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}

struct RefreshSessionServiceOutput: Codable {
    public let accessToken: String
    public let expiresIn: Int
}

extension SessionRequestConfig: DevRequestConfig {
    var baseURL: String {
        "http://192.168.8.208:3000"
    }
    
    var path: String {
        switch self {
        case .startSession:
            "/login"
        case .refreshToken:
            "/refresh"
        }
    }
    
    var method: DevHTTPMethod {
        switch self {
        case .startSession, .refreshToken:
            .post
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
        }
    }
    
    var requiresAuthorization: Bool {
        switch self {
        case .startSession:
            false
        case .refreshToken:
            true
        }
    }
}
