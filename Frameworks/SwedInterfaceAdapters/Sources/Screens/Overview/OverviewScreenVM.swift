//
//  OverviewScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Combine
import DevToolsCore
import SwedApplicationBusinessRules

public protocol OverviewScreenVMInput {
    func viewDidLoad()
    func didTapProfile()
    func didTapNotifications()
    func didPullToRefresh()
}

public protocol OverviewScreenVMOutput {
    var tableSnapshot: CurrentValueSubject<OverviewScreenTableSnapshot, Never> { get }
    var isRefreshing: CurrentValueSubject<Bool, Never> { get }
    var router: OverviewScreenRouter! { get }
    var customer: CustomerDTO { get }
}

public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    // MARK: Properties
    public var isRefreshing = CurrentValueSubject<Bool, Never>(false)
    public var tableSnapshot: CurrentValueSubject<OverviewScreenTableSnapshot, Never>
    public var router: OverviewScreenRouter!
    public var customer: CustomerDTO
    private let loadLatestOffersUseCase: LoadLatestOffersUseCase
    private let fetchCachedOffersUseCase: FetchCachedOffersUseCase
    private var cancelBag: Set<AnyCancellable> = []
    
    // MARK: Lifecycle
    public init(
        customer: CustomerDTO,
        loadLatestOffersUseCase: LoadLatestOffersUseCase,
        fetchCachedOffersUseCase: FetchCachedOffersUseCase
    ) {
        self.customer = customer
        self.loadLatestOffersUseCase = loadLatestOffersUseCase
        self.fetchCachedOffersUseCase = fetchCachedOffersUseCase
        self.tableSnapshot = .init(.init(sections: [], changes: .init()))
    }
}

// MARK: Public methods
public extension DefaultOverviewScreenVM {
    func viewDidLoad() {
        populateTableWithMockedData()
        fetchCachedOffersUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] cachedOffers in
                self?.updateUI(offers: cachedOffers)
            }
            .store(in: &cancelBag)
    }
    
    func didTapProfile() {
        router.routeToProfileScreen(customer: customer)
    }
    
    func didPullToRefresh() {
        guard !isRefreshing.value else { return }
        isRefreshing.value = true
        loadLatestOffersUseCase.use()
            .receiveOnMainThread()
            .sink { [weak self] latestOffers in
                self?.isRefreshing.value = false
                self?.updateUI(offers: latestOffers)
            }
            .store(in: &cancelBag)
    }
    
    func didTapNotifications() {}
}

// MARK: Private methods
public extension DefaultOverviewScreenVM {
    private func updateUI(offers: [OfferDTO]) {
        var newSectionSnapshot = tableSnapshot.value.sections
        let offersSection = makeOffersSection(offers)
        if offersSection.cells.isEmpty {
            newSectionSnapshot.remove(section: offersSection)
        } else {
            newSectionSnapshot.addOrUpdate(section: offersSection)
        }
        tableSnapshot.value = OverviewScreenTableSnapshot(
            sections: newSectionSnapshot,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: newSectionSnapshot
            )
        )
    }
    
    private func makeOffersSection(_ newOffers: [OfferDTO]) -> OverviewScreenSection {
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
    
    private func populateTableWithMockedData() {
        let sections = makeMockTableSections()
        tableSnapshot.value = OverviewScreenTableSnapshot(
            sections: sections,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: sections
            )
        )
    }
    
    private func makeMockTableSections() -> [OverviewScreenSection] {
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
