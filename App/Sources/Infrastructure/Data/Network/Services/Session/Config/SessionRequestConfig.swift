import Foundation
import DevToolsNetworking

enum SessionRequestConfig {
    case startSession(StartSessionDataOutgoing)
}

extension SessionRequestConfig: DevRequestConfig {
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
        case .startSession(let basicLoginInfoOutgoing):
            return try? JSONEncoder().encode(basicLoginInfoOutgoing)
        }
    }
}
