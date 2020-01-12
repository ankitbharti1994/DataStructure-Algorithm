import Foundation

/// Create and manage the sequential list of the same type using linked list
public struct SingleLinkedList<T: Equatable>: LinkedList, IteratorProtocol {
    public typealias Element = T
    
    /// head of a singly linked list
    public var head: Node<T>? = nil
    
    /// counter for iterator protocol
    private var counter = 0
    
    /// empty init method
    public init() {}
    
    /// init with head value
    /// - Parameter value: value which contains the head value
    public init(value: Element) {
        self.head = Node(value: value)
    }
    
    /// check if linked list is empty
    public var isEmpty: Bool {
        head == nil
    }
    
    /// find the total number of element in linked list
    public var count: Int {
        var localHead = head
        var nums = 0
        guard let _ = localHead else {
            return nums
        }

        nums += 1
        while localHead?.next != nil {
            localHead = localHead?.next
            nums += 1
        }

        return nums
    }
    
    /// find a particular value inside linked list
    /// - Parameter value: searcable value
    public func isAvailable(_ value: T) -> Bool {
        var isValueExist = false
        var localHead = head

        if localHead?.value == value {
            isValueExist.toggle()
            return isValueExist
        } else {
            while localHead?.next != nil {
                localHead = localHead?.next
                if localHead?.value == value {
                    isValueExist.toggle()
                    return isValueExist
                } else {
                    continue
                }
            }
        }
    
        return isValueExist
    }
    
    /// append new value to the end of the linked list
    /// - Parameter value: value to append
    public mutating func append(_ value: T) {
        let node = Node(value: value)
        
        guard head != nil else {
            head = node
            return
        }
        
        var localHead = head
        
        if localHead?.next != nil {
            while localHead?.next != nil {
                localHead = localHead?.next
            }
            
            localHead?.next = node
        } else {
            localHead?.next = node
        }
    }
    
    /// insert new value at a given position
    /// - Parameters:
    ///   - value: value which want to insert into linked list
    ///   - index: index at which want to insert new value
    public mutating func insert(_ value: T, at index: Int) {
        guard count >= index else {
            fatalError("Index \(index) is out of bounds.")
        }
        
        if index == 0 {
            insertLeft(value)
        } else if index == count {
            insertRight(value)
        } else {
            var localHead = head
            var nums = 1
            while localHead?.next != nil {
                if index == nums {
                    let next = localHead?.next
                    localHead?.next = Node(value: value)
                    localHead?.next?.next = next
                    return
                } else {
                    localHead = localHead?.next
                    nums += 1
                }
            }
        }
    }
    
    /// insert new value to the start of the linked list
    /// - Parameter value: value, which want to insert
    public mutating func insertLeft(_ value: T) {
        let node = Node(value: value)
        let _head = head
        head = node
        head?.next = _head
    }
    
    /// append value to the end of the linked list
    /// - Parameter value: value, which want to insert.
    public mutating func insertRight(_ value: T) {
        self.append(value)
    }
    
    /// find the node at a given position
    /// - Parameter index: index for the searching item
    /// - Returns: node at given position
    public func node(at index: Int) -> Node<T>? {
        guard index < count else { return nil }
        
        if index == 0 {
            return head
        } else {
            var localHead = head
            var nums = 1

            while localHead?.next != nil {
                if nums == index {
                    return localHead?.next
                } else {
                    localHead = localHead?.next
                    nums += 1
                }
            }
            
            return nil
        }
    }
    
    public mutating func next() -> T? {
        guard counter < count else {
            return nil
        }
        
        let node = self.node(at: counter)
        counter += 1
        return node?.value
    }
}
