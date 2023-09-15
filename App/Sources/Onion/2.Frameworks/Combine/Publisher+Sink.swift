import Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    public func sink() -> AnyCancellable {
        sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in }
        )
    }
}
