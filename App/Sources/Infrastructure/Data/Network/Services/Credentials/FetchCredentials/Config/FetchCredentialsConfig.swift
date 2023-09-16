import DevToolsNetworking

enum FetchCredentialsRequestConfig {
    case login(FetchCredentialsLoginOutgoing)
}

extension FetchCredentialsRequestConfig: DevRequestConfig {
    var baseURL: String {
        ""
    }
    
    var path: String {
        ""
    }
    
    var method: DevToolsNetworking.DevHTTPMethod {
        .post
    }
    
    var authType: DevToolsNetworking.DevRequestAuthType {
        .none
    }
}
