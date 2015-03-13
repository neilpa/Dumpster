//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import Queue
import XCTest

final class QueueTests: XCTestCase {

    func testEmptyQueue() {
        var q = Queue<Int>()
        XCTAssertNil(q.peek())
        XCTAssertNil(q.dequeue())
    }
}
