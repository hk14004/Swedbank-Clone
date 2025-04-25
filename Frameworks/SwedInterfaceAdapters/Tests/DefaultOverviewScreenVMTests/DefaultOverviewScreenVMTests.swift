//
//  DefaultOverviewScreenVMTests.swift
//  SwedEnterpriseBusinessRulesTests
//
//  Created by Hardijs Ķirsis on 21/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import DevToolsCore
import DevToolsUI
@testable import SwedInterfaceAdapters

final class DefaultOverviewScreenVMTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_startup() {
        let expectedSections: [OverviewScreenSection] = [
            .init(
                id: .overview,
                title: "Shit",
                cells: [
                    .cardBalance(.init(id: "1", title: "2", text: "3"))
                ]
            )
        ]
        
        let actualSections: [OverviewScreenSection] = [
            .init(
                id: .overview,
                title: "Shit",
                cells: [
                    .cardBalance(.init(id: "1", title: "2", text: "3"))
                ]
            )
        ]
        
        // Assert
        XCTAssertTrue(expectedSections |==| actualSections)
    }
}
