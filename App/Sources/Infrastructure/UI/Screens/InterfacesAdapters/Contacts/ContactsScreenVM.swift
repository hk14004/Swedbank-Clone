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
import Application
import Localization

public protocol ConstactsScreenVMInput {
    func viewDidLoad()
}

public protocol ConstactsScreenVMOutput {
    var tableSnapshot: CurrentValueSubject<ContactsScreenSectionChangeSnapshot, Never> { get }
    var router: ContactsScreenRouter! { get }
}

public protocol ContactsScreenVM: ConstactsScreenVMInput, ConstactsScreenVMOutput {}

public class DefaultContactsScreenVM: ContactsScreenVM {
    // MARK: Constant
    enum Constant {
        enum ItemID: String {
            case contactUs
            case writeToUs
            case prioritySupport
            case consultation
            case atms
            case faq
        }
    }
    
    // MARK: Properties
    public var tableSnapshot: CurrentValueSubject<ContactsScreenSectionChangeSnapshot, Never>
    public var router: ContactsScreenRouter!
    
    // MARK: Lifecycle
    public init() {
        tableSnapshot = .init(.init(sections: [], changes: .init()))
    }
}

// MARK: Methods
public extension DefaultContactsScreenVM {
    func viewDidLoad() {
        let sections = [
            ContactsScreenSection(
                id: .contactItems,
                cells: makeAllContactItems()
            )
        ]
        let changes = DevHashChangeSet.calculateCellChangeSet(old: [], new: sections)
        tableSnapshot.send(.init(sections: sections, changes: changes))
    }
    
    private func makeAllContactItems() -> [ContactsScreenSection.Cell] {
        [
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.contactUs.rawValue,
                    contactText: Localization.Screen.Contacts.Items.ContactUs.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.ContactUs.descriptionKey,
                    contactIcon: "bubble.left.and.bubble.right"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.writeToUs.rawValue,
                    contactText: Localization.Screen.Contacts.Items.Write.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.Write.descriptionKey,
                    contactIcon: "envelope"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.prioritySupport.rawValue,
                    contactText: Localization.Screen.Contacts.Items.Priority.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.Priority.descriptionKey,
                    contactIcon: "candybarphone"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.consultation.rawValue,
                    contactText: Localization.Screen.Contacts.Items.Consultation.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.Consultation.descriptionKey,
                    contactIcon: "calendar"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.atms.rawValue,
                    contactText: Localization.Screen.Contacts.Items.Atms.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.Atms.descriptionKey,
                    contactIcon: "mappin.and.ellipse"
                )
            ),
            .contactItem(
                ContactsScreenContactCellViewModel(
                    contactID: Constant.ItemID.faq.rawValue,
                    contactText: Localization.Screen.Contacts.Items.Faq.titleKey,
                    contactDescription: Localization.Screen.Contacts.Items.Faq.descriptionKey,
                    contactIcon: "questionmark.bubble"
                )
            )
        ]
    }
}
