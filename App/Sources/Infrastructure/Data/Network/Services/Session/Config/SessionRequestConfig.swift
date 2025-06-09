import Foundation
import DevToolsNetworking

enum SessionRequestConfig {
    case startSession(StartSessionDataOutgoing)
}

extension SessionRequestConfig: DevRequestConfig {
    var baseURL: String {
        "https://github.com"
    }
    
    var path: String {
        switch self {
        case .startSession(let credentials):
            "/hk14004/Swedbank-Clone/raw/refs/heads/dev/App/Resources/Payloads/Session/Customer/\(credentials.customerID)/\(credentials.pinCode)/session-start.json"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        false
    }
}
