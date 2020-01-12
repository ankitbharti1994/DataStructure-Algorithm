import XCTest

final public class LinkedListTest: XCTestCase {
    var linkedList: SingleLinkedList<String>!
    
    override public func setUp() {
        linkedList = SingleLinkedList()
        super.setUp()
    }
    
    func testEmptyLinkedList() {
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func testLinkedListCount() {
        linkedList.append("ankit")
        XCTAssertEqual(linkedList.count, 1, "Linked list should contain 1 node.")
        
        linkedList.append("rohit")
        XCTAssertEqual(linkedList.count, 2, "Linked list should contain 2 node.")
    }
    
    func testHead() {
        linkedList.append("ankit")
        linkedList.append("rohit")
        linkedList.insertLeft("kailash")
        XCTAssertEqual(linkedList.head?.value, "kailash", "head should be kailash")
    }
    
    func testInsertion() {
        linkedList.append("ankit")
        linkedList.append("rohit")
        linkedList.append("kailash")
        linkedList.insert("garima", at: 1)
        
        let node = linkedList.node(at: 1)
        XCTAssertEqual(node?.value, "garima", "garima should be at position 1")
    }
}

