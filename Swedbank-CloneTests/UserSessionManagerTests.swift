//
//  Swedbank_CloneTests.swift
//  Swedbank-CloneTests
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import XCTest
@testable import Swedbank_Clone
import DevToolsCore

// TODO: Move to dev tools tests

final class UserSessionManagerTests: XCTestCase {
    
    func testStartAllSessions() throws {
        // Given
        let exp1 = XCTestExpectation(description: "onGetAllCredentialsCalled")
        let store = CredentialStoreStub()
        store.onGetAllCredentialsCalled = {
            exp1.fulfill()
        }
        let exp2 = XCTestExpectation(description: "onMakeSessionCalled")
        exp2.expectedFulfillmentCount = 2
        let factory = UserSessionFaactoryStub()
        factory.onMakeSessionCalled = {
            exp2.fulfill()
        }
        let sut = makeSUT(credentialsStore: store,
                          userSessionFactory: factory)
        // When
        sut.startAllUserSessions()
        
        // Then
        wait(for: [exp1, exp2], timeout: 0)
    }
}

fileprivate func makeSUT(credentialsStore: BaseUserSessionCredentialsStore<SwedbankUserSessionCredentials>,
                         userSessionFactory: BaseUserSessionFactory<SwedbankUserSessionCredentials>) -> UserSessionManagerImpl {
    return UserSessionManagerImpl(credentialsStore: credentialsStore,
                                  userSessionFactory: userSessionFactory)
}

fileprivate class CredentialStoreStub: BaseUserSessionCredentialsStore<SwedbankUserSessionCredentials> {
    var onGetAllCredentialsCalled: VoidCallback? = nil
    
    override func getAllCredentials() -> [SwedbankUserSessionCredentials] {
        onGetAllCredentialsCalled?()
        return [
            .init(id: "1", authorizationData: .init(bearerToken: "1", refreshToken: "1")),
            .init(id: "2", authorizationData: .init(bearerToken: "2", refreshToken: "2"))
        ]
    }
}

fileprivate class UserSessionFaactoryStub: BaseUserSessionFactory<SwedbankUserSessionCredentials> {
    
    var onMakeSessionCalled: VoidCallback? = nil
    
    override func makeUserSession(with credentials: SwedbankUserSessionCredentials) -> BaseUserSession<SwedbankUserSessionCredentials> {
        onMakeSessionCalled?()
        return super.makeUserSession(with: credentials)
    }
}
