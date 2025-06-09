import Foundation
import DevToolsNetworking

enum SessionRequestConfig {
    case startSession(StartSessionDataOutgoing)
}

extension SessionRequestConfig: DevRequestConfig {
    var baseURL: String {
        "https://httpbin.org"
    }
    
    var path: String {
        "/basic-auth/demo/1234"
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        true
    }
}
