//
//  Dependencies.swift
//  SwedDashboard
//
//  Created by Hardijs on 22/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//
import SwedApplication
import SwedDesignSystem
import SwedLocalization
import DevToolsNavigation
import DevToolsLocalization

public struct Dependencies {
    public let getRemoteOffersUseCase: GetRemoteOffersUseCase
    public let trackCachedOffersUseCase: TrackCachedOffersUseCase
    public let getRemoteAccountsUseCase: GetRemoteAccountsUseCase
    public let trackCachedAccountsUseCase: TrackCachedAccountsUseCase
    public let offerDetailsScreenFactory: any OfferDetailsScreenFactory
    public let logoutUseCase: LogoutUseCase
    
    public init(
        getRemoteOffersUseCase: GetRemoteOffersUseCase,
        trackCachedOffersUseCase: TrackCachedOffersUseCase,
        getRemoteAccountsUseCase: GetRemoteAccountsUseCase,
        trackCachedAccountsUseCase: TrackCachedAccountsUseCase,
        offerDetailsScreenFactory: any OfferDetailsScreenFactory,
        logoutUseCase: LogoutUseCase
    ) {
        self.getRemoteOffersUseCase = getRemoteOffersUseCase
        self.trackCachedOffersUseCase = trackCachedOffersUseCase
        self.getRemoteAccountsUseCase = getRemoteAccountsUseCase
        self.trackCachedAccountsUseCase = trackCachedAccountsUseCase
        self.offerDetailsScreenFactory = offerDetailsScreenFactory
        self.logoutUseCase = logoutUseCase
    }
}

typealias AppColors = SwedDesignSystemAsset.Colors
typealias AppImages = SwedDesignSystemAsset.Images
typealias AppStrings = SwedLocalization
typealias AppLocalization = RuntimeLocalization
typealias AppLocalizationObserver = RuntimeLocalizationObserver
typealias AppLocalizedPreview = RuntimeLocalizedPreview
