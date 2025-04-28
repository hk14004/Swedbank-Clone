//
//  OverviewScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsCore
import SwedApplicationBusinessRules

public protocol OverviewScreenVMInput {
    func viewDidLoad()
    func onProfileTapped()
}

public protocol OverviewScreenVMOutput {
    var sections: [OverviewScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<OverviewScreenSectionChangeSnapshot, Never> { get }
    var router: OverviewScreenRouter! { get }
}

public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    public var sections: [OverviewScreenSection]
    public var sectionsChangePublisher: PassthroughSubject<OverviewScreenSectionChangeSnapshot, Never>
    public var router: OverviewScreenRouter!
    private var customer: CustomerDTO
    
    public init(customer: CustomerDTO) {
        self.customer = customer
        sections = []
        sectionsChangePublisher = .init()
    }
}

public extension DefaultOverviewScreenVM {
    func viewDidLoad() {
        sections = [
            OverviewScreenSection(
                id: .overview,
                title: "title",
                cells: [
                    .cardBalance(
                        OverviewScreenBalanceCellViewModel(
                            iban: "LV16HABA123456789",
                            amount: 19120.44,
                            currencyCode: "eur"
                        )
                    ),
                    .offer(
                        OverviewScreenOfferCellViewModel(
                            offerID: "1",
                            offerText: "Use your Credit Card for your next purchase and enjoy a 5% cashback bonus on your spending!",
                            offerUrl: ""
                        )
                    ),
                    .expenses(
                        OverviewScreenExpensesCellViewModel(
                            id: "1",
                            detailsUrl: "",
                            spentAmount: 999.13,
                            spentCurrency: "eur"
                        )
                    )
                ]
            )
        ]
        let change = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        sectionsChangePublisher.send(OverviewScreenSectionChangeSnapshot(sections: sections, changes: change))
    }
    
    func onProfileTapped() {
        router.routeToProfileScreen(customer: customer)
    }
}
