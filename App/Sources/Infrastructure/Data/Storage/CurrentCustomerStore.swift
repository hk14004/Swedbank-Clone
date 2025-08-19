import Foundation
import SwedApplication

protocol CurrentCustomerStore {
    func getCurrentCustomer() -> Customer?
    func setCurrentCustomer(_ customer: Customer?)
}

class DefaultCurrentCustomerStore: CurrentCustomerStore {
    var customer: Customer?
    
    func getCurrentCustomer() -> Customer? {
        customer
    }
    
    func setCurrentCustomer(_ customer: Customer?) {
        self.customer = customer
    }
}
