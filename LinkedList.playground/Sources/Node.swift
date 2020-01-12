import Foundation

/// Represent a single node of linked list
public class Node<T: Equatable> {
    /// value that a node can contain
    public let value: T
    
    /// pointer to the next node
    public var next: Node<T>?
    
    /// init with value
    /// - Parameter value: value of type T
    public init(value: T) {
        self.value = value
    }
}
