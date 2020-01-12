import Foundation

var sll = SingleLinkedList<String>(value: "dhoni")

for value in ["ankit", "rohit", "garima", "kailash", "sumit"] {
    sll.append(value)
}

sll.head?.value
sll.isAvailable("kajal")
sll.insertLeft("kajal")
sll.insertRight("vineet")
sll.insert("sam", at: 5)
print(sll)
