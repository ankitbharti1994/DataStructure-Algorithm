import Foundation

/// Find the missing number from given array
extension Array where Element == Int {
    func missingNumbers(from list: [Element]) -> [Element] {
        var mn = [Element]()
        
        guard !self.isEmpty else {
            return mn
        }
        
        mn = Array(Set(list).symmetricDifference(Set(self)))
        
        return mn
    }
    
    /// Find the missing number from given array
    func missingNumber(from list: [Element]) -> [Element] {
        let diff = list.difference(from: self)

        var newVal = [Int]()
        for change in diff {
            switch change {
            case let .remove(_, removedElement, _):
                newVal.append(removedElement)
            default:
                ()
            }
        }
        
        return newVal
    }
}

var numbers: [Int] {
    var values = [Int]()

    for val in 1...100 where (val != 80 && val != 90) {
        values.append(val)
    }
    
    return values
}


// before swift 5.1
Array(1...100).missingNumbers(from: numbers)

// from swift 5.1
Array(1...100).missingNumber(from: numbers)


// Find the first repeated character from string
struct Storage<T: Hashable> {
    private(set) var keys: [T] = []
    private var values: [T: Int] = [:]
    
    subscript(for key: T) -> Int {
        return self.values[key] ?? 0
    }
    
    mutating func append(_ val: T) {
        defer {
            values[val] = (values[val] ?? 0) + 1
        }
        
        guard keys.contains(val) else {
            keys.append(val)
            return
        }
    }
}

extension String {
    private var storage: Storage<Character> {
        var st = Storage<Character>()
        for ch in self {
            st.append(ch)
        }
        
        return st
    }
    
    var firstNonRepeatedCharacter: Character? {
        var fnrc: Character? = nil
        let keys = self.storage.keys
        
        fnrc = keys.first {
            self.storage[for: $0] == 1
        }
        
        return fnrc
    }
}

"Aannkkit".firstNonRepeatedCharacter
