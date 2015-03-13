//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a FIFO data structure
public protocol QueueType {
    /// Value type stored in `QueueType`
    typealias Element

    /// Appends an element to the end of `QueueType`
    mutating func enqueue(element: Element)

    /// Removes the first element in `QueueType` and returns it, `nil` if empty.
    mutating func dequeue() -> Element?

    /// Returns the first element in `QueueType`, `nil` if empty.
    func peek() -> Element?
}
