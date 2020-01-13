import Foundation

var sll = SingleLinkedList(value: "dhoni")

for value in ["ankit", "rohit", "garima", "kailash", "sumit"] {
    sll.append(value)
}

sll.head?.value
sll.isAvailable("kajal")
sll.insertLeft("kajal")
sll.insertRight("vineet")
sll.insert("sam", at: 5)
print(sll, sll.count)
print(sll.node(at: 3))

let sll1 = SingleLinkedList<String>()
sll1.isAvailable("ankit")

while let value = sll.next() {
    print(value)
}

// Testing
LinkedListTest.defaultTestSuite.run()

class F1 {
    func xyz() {}
}


"Ankit" == "Ankit"
"Ankit".caseInsensitiveCompare("ANKIT") == .orderedSame
