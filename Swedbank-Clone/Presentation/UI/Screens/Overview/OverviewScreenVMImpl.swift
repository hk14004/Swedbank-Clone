//
//  OverviewScreenVMImpl.swift
//  Swedbank-Clone
//
//  Created by Hardijs Ķirsis on 12/06/2023.
//

import Combine
import Foundation

class OverviewScreenVMImpl {
    
    @Published var sections: [OverviewScreenSection] = []
    var sectionsPublisher: Published<[OverviewScreenSection]>.Publisher {
        return $sections
    }
    
    init() {
        startup()
    }
}

extension OverviewScreenVMImpl: OverviewScreenVM {
    
}

// MARK: Private

extension OverviewScreenVMImpl {
    private func startup() {
        sections = [
            .init(identifier: .overview, title: "Overview", cells: [
                .cardBalance,
                .offer,
                .expenses
            ])
        ]
    }
}
