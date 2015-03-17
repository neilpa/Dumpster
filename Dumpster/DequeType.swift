//  Copyright (c) 2015 Neil Pankey. All rights reserved.

public protocol DequeType : QueueType, StackType {
    /// Returns the last value in `DequeType`, `nil` if empty.
    var last: Element? { get }

    /// Removes the last value in `DequeType` and returns it, `nil` if empty.
    mutating func popLast() -> Element?
}
