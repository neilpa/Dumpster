//  Copyright (c) 2015 Neil Pankey. All rights reserved.

public protocol QueueType {
    typealias Element

    mutating func enqueue(element: Element)

    mutating func dequeue() -> Element?

    func peek() -> Element?
}
