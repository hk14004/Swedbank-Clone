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
import SwedEnterpriseBusinessRules

public protocol OverviewScreenVMInput {
    func viewDidLoad()
    func didTapProfile()
    func didTapNotifications()
    func didPullToRefresh()
}

public protocol OverviewScreenVMOutput {
    var tableSnapshot: CurrentValueSubject<OverviewScreenSectionChangeSnapshot, Never> { get }
    var isRefreshing: CurrentValueSubject<Bool, Never> { get }
    var router: OverviewScreenRouter! { get }
    var customer: CustomerDTO { get }
}

public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    // MARK: Properties
    public var isRefreshing = CurrentValueSubject<Bool, Never>(false)
    public var tableSnapshot: CurrentValueSubject<OverviewScreenSectionChangeSnapshot, Never>
    public var router: OverviewScreenRouter!
    public var customer: CustomerDTO
    private let loadLatestOffersUseCase: LoadLatestOffersUseCase
    private var cancelBag: Set<AnyCancellable> = []
    
    // MARK: Lifecycle
    public init(
        customer: CustomerDTO,
        loadLatestOffersUseCase: LoadLatestOffersUseCase
    ) {
        self.customer = customer
        self.loadLatestOffersUseCase = loadLatestOffersUseCase
        self.tableSnapshot = .init(.init(sections: [], changes: .init()))
    }
}

// MARK: Public methods
public extension DefaultOverviewScreenVM {
    func viewDidLoad() {
        let sections = makeMockedDataToPopulateTable()
        tableSnapshot.value = OverviewScreenSectionChangeSnapshot(
            sections: sections,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: sections
            )
        )
    }
    
    func didTapProfile() {
        router.routeToProfileScreen(customer: customer)
    }
    
    func didPullToRefresh() {
        guard !isRefreshing.value else { return }
        isRefreshing.value = true
        loadLatestOffersUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] offers in
                self?.isRefreshing.value = false
                self?.updateUI(offers: offers)
            }
            .store(in: &cancelBag)
    }
    
    func didTapNotifications() {}
}

// MARK: Private methods
public extension DefaultOverviewScreenVM {
    private func updateUI(offers: [Offer]) {
        var newSectionSnapshot = tableSnapshot.value.sections
        let offersSection = makeOffersSection(offers)
        if offersSection.cells.isEmpty {
            newSectionSnapshot.remove(section: offersSection)
        } else {
            newSectionSnapshot.addOrUpdate(section: offersSection)
        }
        tableSnapshot.value = OverviewScreenSectionChangeSnapshot(
            sections: newSectionSnapshot,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: newSectionSnapshot
            )
        )
    }
    
    private func makeOffersSection(_ newOffers: [Offer]) -> OverviewScreenSection {
        OverviewScreenSection(
            id: .offers,
            title: "",
            cells: newOffers.map { offer in
                OverviewScreenSection.Cell.offer(
                    OverviewScreenOfferCellViewModel(offer: offer)
                )
            }
        )
    }
    
    private func makeMockedDataToPopulateTable() -> [OverviewScreenSection] {
        [
            OverviewScreenSection(
                id: .overview,
                title: "",
                cells: [
                    .cardBalance(
                        OverviewScreenBalanceCellViewModel(
                            iban: "LV16HABA123456789",
                            amount: 19120.44,
                            currencyCode: "eur"
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
    }
}
