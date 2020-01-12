import Foundation

/// protocol which manages the linked list
public protocol LinkedList {
    associatedtype Element where Element : Equatable
    var head: Node<Element>? { get set }
    var isEmpty: Bool { get }
    var count: Int { get }
    init()
    init(value: Element)
    func isAvailable(_ value: Element) -> Bool
    func node(at index: Int) -> Node<Element>?
    mutating func append(_ value: Element)
    mutating func insert(_ value: Element, at index: Int)
    mutating func insertLeft(_ value: Element)
    mutating func insertRight(_ value: Element)
}
