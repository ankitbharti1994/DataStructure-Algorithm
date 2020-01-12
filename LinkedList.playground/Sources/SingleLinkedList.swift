import Foundation

public struct SingleLinkedList<T: Equatable>: LinkedList {
    public typealias Element = T
    public var head: Node<T>? = nil
    
    public init() {}
    
    public init(value: Element) {
        self.head = Node(value: value)
    }

    public var isEmpty: Bool {
        head == nil
    }

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
    
    public func isAvailable(_ value: T) -> Bool {
        var isValueExist = false
        var localHead = head
        
        guard let _localHead = localHead else {
            return isValueExist
        }

        if _localHead.value == value {
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
    
    public mutating func insertLeft(_ value: T) {
        let node = Node(value: value)
        let _head = head
        head = node
        head?.next = _head
    }
    
    public mutating func insertRight(_ value: T) {
        self.append(value)
    }
}
