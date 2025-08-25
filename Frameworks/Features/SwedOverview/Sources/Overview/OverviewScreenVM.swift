//
//  OverviewScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//
import UIKit
import Combine
import DevToolsCore
import SwedApplication

public protocol OverviewScreenVMInput {
    func didTapProfile()
    func didTapNotifications()
    func didPullToRefresh()
}

public protocol OverviewScreenVMOutput {
    var tableSnapshot: CurrentValueSubject<OverviewScreenTableSnapshot, Never> { get }
    var isRefreshing: CurrentValueSubject<Bool, Never> { get }
    var router: OverviewScreenRouter! { get }
    var customer: Customer { get }
}

public protocol OverviewScreenVM: OverviewScreenVMInput, OverviewScreenVMOutput {}

public class DefaultOverviewScreenVM: OverviewScreenVM {
    // MARK: Properties
    public var isRefreshing = CurrentValueSubject<Bool, Never>(false)
    public var tableSnapshot: CurrentValueSubject<OverviewScreenTableSnapshot, Never>
    public var router: OverviewScreenRouter!
    public var customer: Customer
    private let getRemoteOffersUseCase: GetRemoteOffersUseCase
    private let trackCachedOffersUseCase: TrackCachedOffersUseCase
    private let getRemoteAccountsUseCase: GetRemoteAccountsUseCase
    private let trackCachedAccountsUseCase: TrackCachedAccountsUseCase
    private var cancelBag: Set<AnyCancellable> = []
    
    // MARK: Lifecycle
    public init(
        customer: Customer,
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
        updateWithRemoteData()
    }
    
    func didTapProfile() {
        router.launchProfileIntent()
    }
    
    func didTapNotifications() {}
}

// MARK: Private methods
public extension DefaultOverviewScreenVM {
    private func setup() {
        populateTableWithMockedData()
        populateTableWithCachedOffers()
        populateTableWithCachedAccounts()
        updateWithRemoteData()
    }
    
    // MARK: UI Updates
    private func populateTableWithCachedOffers() {
        trackCachedOffersUseCase.use()
            .prefix(1)
            .receiveOnMainThread()
            .sink { [weak self] cachedOffers in
                guard let self else { return }
                amendUISections(amended: [makeOffersSection(cachedOffers)])
            }
            .store(in: &cancelBag)
    }
    
    private func populateTableWithCachedAccounts() {
        trackCachedAccountsUseCase.use()
            .prefix(1)
            .receiveOnMainThread()
            .sink { [weak self] accounts in
                guard let self else { return }
                amendUISections(amended: [makeAccountsSection(accounts)])
            }
            .store(in: &cancelBag)
    }
    
    private func amendUISections(amended sections: [OverviewScreenSection]) {
        var updatedSections = tableSnapshot.value.sections
        
        for section in sections {
            if section.cells.isEmpty {
                updatedSections.remove(section: section)
            } else {
                updatedSections.addOrUpdate(section: section)
            }
        }
        
        updatedSections.sort { $0.id.order < $1.id.order }
        
        isRefreshing.value = false
        tableSnapshot.value = OverviewScreenTableSnapshot(
            sections: updatedSections,
            changes: DevHashChangeSet.calculateCellChangeSet(
                old: tableSnapshot.value.sections,
                new: updatedSections
            )
        )
    }
    
    // MARK: Remote data
    private func updateWithRemoteData() {
        isRefreshing.value = true
        Future<Void, Error> { promise in
            Task { [weak self] in
                guard let self else { return }
                
                do {
                    async let result = (
                        try getRemoteOffersUseCase.use().async(),
                        try getRemoteAccountsUseCase.use().async()
                    )
                    
                    let (latestOffers, latestAccounts) = try await result
                    
                    await MainActor.run {
                        self.amendUISections(amended: [
                            self.makeOffersSection(latestOffers),
                            self.makeAccountsSection(latestAccounts)
                        ])
                        promise(.success(()))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .receiveOnMainThread()
        .sink(
            receiveValue: { _ in },
            completionError: { [weak self] error in
                self?.isRefreshing.value = false
                self?.router.routeToOkeyErrorAlert(error, onDismiss: nil)
            }
        )
        .store(in: &cancelBag)
    }
    
    // MARK:  Section building
    private func makeOffersSection(_ newOffers: [Offer]) -> OverviewScreenSection {
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
    
    private func makeAccountsSection(_ accounts: [Account]) -> OverviewScreenSection {
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
        amendUISections(amended: [section])
    }
}
