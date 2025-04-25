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
                    contactText: "Screen.Contacts.Items.contactUs.title",
                    contactDescription: "Screen.Contacts.Items.contactUs.description",
                    contactIcon: "bubble.left.and.bubble.right"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "write",
                    contactText: "Screen.Contacts.Items.write.title",
                    contactDescription: "Screen.Contacts.Items.write.description",
                    contactIcon: "envelope"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "priority",
                    contactText: "Screen.Contacts.Items.priority.title",
                    contactDescription: "Screen.Contacts.Items.priority.description",
                    contactIcon: "candybarphone"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "consultation",
                    contactText: "Screen.Contacts.Items.consultation.title",
                    contactDescription: "Screen.Contacts.Items.consultation.description",
                    contactIcon: "calendar"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "ATMs",
                    contactText: "Screen.Contacts.Items.atms.title",
                    contactDescription: "Screen.Contacts.Items.atms.description",
                    contactIcon: "mappin.and.ellipse"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: "FAQ",
                    contactText: "Screen.Contacts.Items.faq.title",
                    contactDescription: "Screen.Contacts.Items.faq.description",
                    contactIcon: "questionmark.bubble"
                )
            )
        ]
    }
}
