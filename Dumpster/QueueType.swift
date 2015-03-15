//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a FIFO container.
public protocol QueueType : Poppable {
    /// Appends an element to the end of `QueueType`
    mutating func pushLast(element: Element)
}
