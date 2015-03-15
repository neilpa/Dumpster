//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import Queue
import XCTest
import Assertions

final class QueueTests: XCTestCase {

    func testEmptyQueue() {
        var q = Queue<Int>()
        assertEmpty(q)
    }

    func testEnqueueDequeue() {
        var q = Queue<Int>()
        q.enqueue(1)
        q.enqueue(2)
        q.enqueue(3)

        assertEqual(q.dequeue(), 1)
        assertEqual(q.dequeue(), 2)
        assertEqual(q.first, 3)

        q.enqueue(4)
        assertEqual(q.dequeue(), 3)
        assertEqual(q.dequeue(), 4)
        assertEmpty(q)
    }

    func testArrayLiteralConvertible() {
        // TODO
    }

    func testSequenceType() {
        // TODO
    }

    func testCollectionType() {
        // TODO
    }

    func testExtensibleCollectionType() {
        // TODO
    }

    func testSliceable() {
        var q: Queue = ["foo", "bar", "baz"]
        let index = q.startIndex.successor()
        var s = q[index..<index.successor()]

        assertEqual(s.first, "bar")
        assertEqual(s.dequeue(), "bar")
        assertEmpty(s)

        assertEqual(q.dequeue(), "foo")
        assertEqual(q.dequeue(), "bar")
        assertEqual(q.dequeue(), "baz")
        assertEmpty(q)
    }

    func assertEmpty<T>(var q: Queue<T>) {
        assertEqual(q.isEmpty, true)
        assertNil(q.first)
        assertNil(q.dequeue())
    }
}
