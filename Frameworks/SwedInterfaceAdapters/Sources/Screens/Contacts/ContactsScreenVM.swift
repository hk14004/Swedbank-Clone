//
//  ConstactsScreenVM.swift
//  SwedInterfaceAdapters
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import DevToolsCore
import SwedApplicationBusinessRules
import SwedLocalization

public protocol ConstactsScreenVMInput {
    func viewDidLoad()
}

public protocol ConstactsScreenVMOutput {
    var sections: [ContactsScreenSection] { get }
    var sectionsChangePublisher: PassthroughSubject<ContactsScreenSectionChangeSnapshot, Never> { get }
    var router: ContactsScreenRouter! { get }
}

public protocol ContactsScreenVM: ConstactsScreenVMInput, ConstactsScreenVMOutput {}

public class DefaultContactsScreenVM: ContactsScreenVM {
    public var sections: [ContactsScreenSection]
    public var sectionsChangePublisher: PassthroughSubject<ContactsScreenSectionChangeSnapshot, Never>
    public var router: ContactsScreenRouter!
    
    public init() {
        sections = []
        sectionsChangePublisher = .init()
    }
}

public extension DefaultContactsScreenVM {
     func viewDidLoad() {
        sections = [
            ContactsScreenSection(
                id: .contactItems,
                title: "",
                cells: makeAllContactItems()
            )
        ]
        let change = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        sectionsChangePublisher.send(.init(sections: sections, changes: change))
     }
    
    private func makeAllContactItems() -> [ContactsScreenSection.Cell] {
        [
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "contactUS",
                    contactText: SwedLocalization.Screen.Contacts.Items.ContactUs.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.ContactUs.descriptionKey,
                    contactIcon: "bubble.left.and.bubble.right"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "write",
                    contactText: SwedLocalization.Screen.Contacts.Items.Write.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.Write.descriptionKey,
                    contactIcon: "envelope"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "priority",
                    contactText: SwedLocalization.Screen.Contacts.Items.Priority.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.Priority.descriptionKey,
                    contactIcon: "candybarphone"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "consultation",
                    contactText: SwedLocalization.Screen.Contacts.Items.Consultation.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.Consultation.descriptionKey,
                    contactIcon: "calendar"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "ATMs",
                    contactText: SwedLocalization.Screen.Contacts.Items.Atms.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.Atms.descriptionKey,
                    contactIcon: "mappin.and.ellipse"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "FAQ",
                    contactText: SwedLocalization.Screen.Contacts.Items.Faq.titleKey,
                    contactDescription: SwedLocalization.Screen.Contacts.Items.Faq.descriptionKey,
                    contactIcon: "questionmark.bubble"
                )
            )
        ]
    }
}
