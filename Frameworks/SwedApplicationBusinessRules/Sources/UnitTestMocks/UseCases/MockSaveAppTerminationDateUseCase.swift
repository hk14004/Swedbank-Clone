//
//  MockSaveAppTerminationDateUseCase.swift
//  App Unit Tests
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation

class MockSaveAppTerminationDateUseCase: SaveAppTerminationDateUseCase {
    var useCalledSpy: ((Date?)->())?
    func use(terminationDate: Date?) {
        useCalledSpy?(terminationDate)
    }
}
