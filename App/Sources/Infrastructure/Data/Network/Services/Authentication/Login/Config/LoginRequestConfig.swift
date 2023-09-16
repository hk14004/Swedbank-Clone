import Foundation
import DevToolsNetworking

enum LoginRequestConfig {
    case login(BasicLoginInfoOutgoing)
}

extension LoginRequestConfig: DevRequestConfig {
    var baseURL: String {
        ""
    }
    
    var path: String {
        ""
    }
    
    var method: DevHTTPMethod {
        .post
    }
    
    var authType: DevRequestAuthType {
        .none
    }
    
    var bodyParameters: Data? {
        switch self {
        case .login(let basicLoginInfoOutgoing):
            return try? JSONEncoder().encode(basicLoginInfoOutgoing)
        }
    }
}
