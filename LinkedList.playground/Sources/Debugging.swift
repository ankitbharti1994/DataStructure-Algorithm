import Foundation

extension SingleLinkedList: CustomStringConvertible {
    public var description: String {
        var message: String = ""
        var localHead = head
        guard let _localHead = localHead else {
            return message
        }

        message += "\(_localHead.value)"

        while localHead?.next != nil {
            localHead = localHead?.next
            message += " -> \(localHead!.value)"
        }

        return message
    }
}
