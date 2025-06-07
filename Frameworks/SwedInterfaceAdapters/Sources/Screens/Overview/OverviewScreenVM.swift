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
    private let getRemoteOffersUseCase: GetRemoteOffersUseCase
    private let trackCachedOffersUseCase: TrackCachedOffersUseCase
    private let getRemoteAccountsUseCase: GetRemoteAccountsUseCase
    private let trackCachedAccountsUseCase: TrackCachedAccountsUseCase
    private var cancelBag: Set<AnyCancellable> = []
    
    // MARK: Lifecycle
    public init(
        customer: CustomerDTO,
        getRemoteOffersUseCase: GetRemoteOffersUseCase,
        trackCachedOffersUseCase: TrackCachedOffersUseCase,
        getRemoteAccountsUseCase: GetRemoteAccountsUseCase,
        trackCachedAccountsUseCase: TrackCachedAccountsUseCase
    ) {
        self.customer = customer
        self.getRemoteOffersUseCase = getRemoteOffersUseCase
        self.trackCachedOffersUseCase = trackCachedOffersUseCase
        self.getRemoteAccountsUseCase = getRemoteAccountsUseCase
        self.trackCachedAccountsUseCase = trackCachedAccountsUseCase
        self.tableSnapshot = .init(.init(sections: [], changes: .init()))
        setup()
    }
}

// MARK: Public methods
public extension DefaultOverviewScreenVM {
    func didPullToRefresh() {
        guard !isRefreshing.value else { return }
        isRefreshing.value = true

        Publishers.Zip(
            getRemoteOffersUseCase.use(),
            getRemoteAccountsUseCase.use()
        )
        .receiveOnMainThread()
        .sink { [weak self] latestOffers, accounts in
            guard let self else { return }
            isRefreshing.value = false
            updateUI(with: makeOffersSection(latestOffers))
            updateUI(with: makeAccountsSection(accounts))
        }
        .store(in: &cancelBag)
    }
    
    func didTapProfile() {
        router.routeToProfileScreen(customer: customer)
    }
    
    func didTapNotifications() {}
}

// MARK: Private methods
public extension DefaultOverviewScreenVM {
    private func setup() {
        populateTableWithMockedData()
        populateTableWithCachedOffers()
        populateTableWithCachedAccounts()
        didPullToRefresh() // Temp solution for now to trigger initial data load
    }
    
    private func populateTableWithCachedOffers() {
        trackCachedOffersUseCase.use()
            .prefix(1)
            .receiveOnMainThread()
            .sink { [weak self] cachedOffers in
                guard let self else { return }
                updateUI(with: makeOffersSection(cachedOffers))
            }
            .store(in: &cancelBag)
    }
    
    private func populateTableWithCachedAccounts() {
        trackCachedAccountsUseCase.use()
            .prefix(1)
            .receiveOnMainThread()
            .sink { [weak self] accounts in
                guard let self else { return }
                updateUI(with: makeAccountsSection(accounts))
            }
            .store(in: &cancelBag)
    }
    
    private func updateUI(with newSection: OverviewScreenSection) {
        var sections = tableSnapshot.value.sections
        if newSection.cells.isEmpty {
            sections.remove(section: newSection)
        } else {
            sections.addOrUpdate(section: newSection)
        }
        sections.sort { $0.id.order < $1.id.order }
        tableSnapshot.value = OverviewScreenTableSnapshot(
            sections: sections,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: sections
            )
        )
    }
    
    private func makeOffersSection(_ newOffers: [OfferDTO]) -> OverviewScreenSection {
        OverviewScreenSection(
            id: .offers,
            cells: newOffers.map { offer in
                OverviewScreenSection.Cell.offer(
                    OverviewScreenOfferCellViewModel(
                        offer: offer,
                        didTap: { [weak self] in
                            // Optionally handle input from cell model first if its needed
                            self?.router.routeToOfferDetails(offer: offer)
                        }
                    )
                )
            }
        )
    }
    
    private func makeAccountsSection(_ accounts: [AccountDTO]) -> OverviewScreenSection {
        OverviewScreenSection(
            id: .accounts,
            cells: accounts.map { account in
                    .cardBalance(
                        OverviewScreenBalanceCellViewModel(
                            iban: account.iban,
                            amount: account.availableFunds,
                            currencyCode: "eur"
                        )
                    )
            }
        )
    }
    
    private func populateTableWithMockedData() {
        let section = OverviewScreenSection(
            id: .expenses,
            cells: [
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
        updateUI(with: section)
    }
}
