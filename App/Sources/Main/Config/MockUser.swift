import Foundation
import SwedApplicationBusinessRules

let JAMES_BOND = Customer(
    id: "007",
    displayName: "James Bond",
    type: .private,
    hasIpRestriction: false,
    hasUsableAccounts: true,
    sortOrder: 0,
    roles: [.private],
    authorities: [],
    isMain: true
)

let TOKEN_EXPIRE_TIME_IN_MINS = 1
