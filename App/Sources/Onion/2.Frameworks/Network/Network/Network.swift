import Combine
import Foundation
import DevToolsCore

public protocol Network: AnyObject {
    func execute<T: NetworkResponse>(_ requestConfig: RequestConfig) -> AnyPublisher<T, Error>
    func execute<T: NetworkResponse>(_ requestConfig: RequestConfig) -> AnyPublisher<[T], Error>
}
