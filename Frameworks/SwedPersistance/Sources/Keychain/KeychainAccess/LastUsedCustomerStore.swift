import Foundation
import SwedApplication
import KeychainAccess

public protocol LastUsedCustomerStore {
    func getLastUsedCustomerID() -> String?
    func setLastUsedCustomerID(_ string: String?)
}

public class DefaultLastUsedCustomerStore: LastUsedCustomerStore {

    // MARK: Properties
    private let keychain: Keychain
    private let key = "LastUsedCustomer"
    
    // MARK: init
    
    public init(keychain: Keychain) {
        self.keychain = keychain
    }

    public func getLastUsedCustomerID() -> String? {
        guard let data = try? keychain.getData(key) else {
            try? keychain.remove(key)
            return nil
        }
        let decoded = try? JSONDecoder().decode(String.self, from: data)
        return decoded
    }
    
    public func setLastUsedCustomerID(_ string: String?) {
        guard let id = string else {
            try? keychain.remove(key)
            return
        }
        guard let data = try? JSONEncoder().encode(id) else {
            try? keychain.remove(key)
            return
        }
        try? keychain.set(data, key: key)
    }
}
