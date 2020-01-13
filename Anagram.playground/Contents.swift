import Foundation

/// postfix increment
/// - Parameter value: int value which want to increment by 1
postfix func ++(value: inout Int) {
    value += 1
}

extension String {
    /// subscript to get the string from a particular index
    subscript(_ index: Int) -> String {
        get {
            String(Array(self)[index..<index + 1])
        }
        
        set(newValue) {
            var value = Array(self)
            value[index] = Character(newValue)
            self = String(value)
        }
    }
    
    /// Swap the two character of a string
    /// - Parameters:
    ///   - sourceIndex: source index of a index
    ///   - destinationIndex: destination index of string
    func swap(sourceIndex: Int, destinationIndex: Int) -> String {
        let first = self[sourceIndex]
        let second = self[destinationIndex]
        
        var copyStr = self
        
        copyStr[sourceIndex] = second
        copyStr[destinationIndex] = first
        
        return copyStr
    }
    
    /// generate list of anagrams from string
    /// permutation of a string will be n! where n is the length of string
    ///
    ///     Examples: -
    ///         "ABC":
    ///             Length = 3
    ///             So, factorial of 3 is 3 * 2 * 1 = 6 (anagrams)
    ///         "ABCD":
    ///             Length = 4
    ///             So, factorial of 4 is 4 * 3 * 2 * 1 = 24 (anagrams)
    ///
    ///     Uses: -
    ///         var input_Str = "ABC"
    ///         let anagram_list = input_Str.generateAnagrams()
    ///         print(anagram_list)
    ///
    ///         Output: -
    ///             ["ABC", "BAC", "CBA", "ACB", "BCA", "CAB"]
    ///
    mutating func generateAnagrams() -> [String] {
        var anagrams_buffer = [self]
        var counter = 0
        
        while counter < self.count {
            let currentData = anagrams_buffer
            anagrams_buffer.removeAll()
            for var str in currentData {
                let arr = str.anagrams(from: counter)
                anagrams_buffer.append(contentsOf: arr)
            }
            
            counter++
        }
        
        return anagrams_buffer
    }
    
    /// perform the swapping of two characters from a spific index to the further down
    /// - Parameter index: start index for swapping
    mutating private func anagrams(from index: Int) -> [String] {
        var anagrams_buffer = [String]()
        for count in index..<self.count {
            let new_anagram_string = self.swap(sourceIndex: index, destinationIndex: count)
            if anagrams_buffer.contains(new_anagram_string) {
                continue
            } else {
                anagrams_buffer.append(new_anagram_string)
            }
        }
        
        return anagrams_buffer
    }
}

// Uses
var input = "ABCDF"

let arr = input.generateAnagrams()
print(arr, arr.count, Set(arr).count)
