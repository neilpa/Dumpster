//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a LIFO container.
public protocol StackType {
    /// Value type stored in `StackType`.
    typealias Element

    /// Returns true if `StackType` is empty.
    var isEmpty: Bool { get }

    /// Returns the first element in `StackType`, `nil` if empty.
    var first: Element? { get }

    /// Prepends an element to the end of `StackType`
    mutating func push(element: Element)

    /// Removes the first element in `StackType` and returns it, `nil` if empty.
    mutating func pop() -> Element?
}
