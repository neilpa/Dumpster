//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a FIFO container.
public protocol QueueType : Poppable {
    /// Appends `value` to the end of `QueueType`.
    mutating func insertLast(value: Element)
}
