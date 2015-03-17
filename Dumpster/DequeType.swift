//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a double-ended queue where values inserted and removed from the front or back.
public protocol DequeType : QueueType, StackType {
    /// Returns the last value in `DequeType`, `nil` if empty.
    var last: Element? { get }

    /// Removes the last value in `DequeType` and returns it.
    mutating func removeLast() -> Element
}
