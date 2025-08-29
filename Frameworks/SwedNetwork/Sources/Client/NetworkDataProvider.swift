//
//  NetworkDataProvider.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsNetworking

public class DefaultNetworkDataProvider: NSObject, DevNetworkDataProvider {
    lazy var session = URLSession(
        configuration: URLSessionConfiguration.default,
        delegate: self,
        delegateQueue: nil
    )
    
    public func output(for request: URLRequest) -> AnyPublisher<DevNetworkDataProvider.Output, URLError> {
        session.dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

// MARK: - URLSessionDelegate
extension DefaultNetworkDataProvider: URLSessionDelegate {
    public func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        guard let trust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        let urlCredential = URLCredential(trust: trust)
        completionHandler(.useCredential, urlCredential)
    }
}
