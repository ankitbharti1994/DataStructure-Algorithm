import Foundation

class Node<T: Hashable> {
    let value: T
    var child: Node?
    
    private var message = ""
    
    init(value: T) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "\(self.value)"
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
let node4 = Node(value: 4)
let node5 = Node(value: 5)
let node6 = Node(value: 6)

node1.child = node2
node2.child = node3
node3.child = node4
node4.child = node5
node5.child = node6

extension Node {
    func path(to destination: Node) -> String {
        guard value != destination.value else {
            return "\(self)"
        }
        
        guard let sourceChild = child else {
            return String(describing: value)
        }
        
        if sourceChild.value == destination.value {
            message += "\(self) -> \(destination)"
            return message
        } else {
            message += "\(self) -> "
            sourceChild.message += "\(message)"
            return sourceChild.path(to: destination)
        }
    }
}

print(node1.path(to: node4))
