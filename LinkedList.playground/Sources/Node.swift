import Foundation

public class Node<T: Equatable> {
    public let value: T
    public var next: Node<T>?

    public init(value: T) {
        self.value = value
    }
}
