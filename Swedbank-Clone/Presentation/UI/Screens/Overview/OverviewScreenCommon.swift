//
//  OverviewScreenCommon.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import Foundation
import Combine
import DevToolsUI

protocol OverviewScreenVM: ObservableObject {
    var sections: [OverviewScreenSection] { get }
    var sectionsPublisher: Published<[OverviewScreenSection]>.Publisher { get }
}

class OverviewScreenSection: UISectionModelProtocol {
    enum Identifier: String, CaseIterable {
        case overview
    }
    
    enum Cell: Hashable {
        case cardBalance
        case offer
        case expenses
    }
    
    let identifier: Identifier
    var title: String
    var cells: [Cell]
    
    init(identifier: Identifier, title: String, cells: [Cell]) {
        self.identifier = identifier
        self.title = title
        self.cells = cells
    }
    
}
