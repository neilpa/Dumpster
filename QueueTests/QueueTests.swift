//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import Queue
import XCTest
import Assertions

final class QueueTests: XCTestCase {

    func testEmptyQueue() {
        var q = Queue<Int>()
        assert(q.isEmpty)
        assertNil(q.first)
        assertNil(q.dequeue())
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
        assertNil(q.dequeue())
    }

    func testSliceable() {
        var q: Queue = ["foo", "bar", "baz"]
        let index = q.startIndex.successor()
        var s = q[index..<index.successor()]

        assertEqual(s.dequeue(), "bar")
        assert(s.isEmpty)

        assertEqual(q.dequeue(), "foo")
        assertEqual(q.dequeue(), "bar")
        assertEqual(q.dequeue(), "baz")
    }
}
