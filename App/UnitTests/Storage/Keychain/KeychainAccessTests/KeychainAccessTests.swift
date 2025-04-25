//
//  KeychainAccessTests.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import KeychainAccess

final class KeychainAccessTests: XCTestCase {
    
    var mocks: Mocks!
    var sut: Keychain!
    
    override func setUpWithError() throws {
        mocks = Mocks()
        sut = mocks.makeSUT()
    }
    
    override func tearDownWithError() throws {
        mocks = nil
        sut = nil
    }
    
    func testKeychainWriteAndRead() {
        // Unique key and value for testing
        let testKey = "testKey"
        let testValue = "testValue"
        
        // Write the test value to the keychain
        do {
            try sut.set(testValue, key: testKey)
        } catch {
            XCTFail("Failed to write to the keychain: \(error)")
        }
        
        // Read the value back from the keychain
        var retrievedValue: String?
        do {
            retrievedValue = try sut.get(testKey)
        } catch {
            XCTFail("Failed to read from the keychain: \(error)")
        }
        
        // Assert that the retrieved value matches the test value
        XCTAssertEqual(retrievedValue, testValue, "The value retrieved from the keychain should match the test value.")
    }
}
