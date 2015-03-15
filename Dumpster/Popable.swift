//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a single-ended container (e.g. stack/queue) where elements are removed from the front.
public protocol Poppable {
    /// Value type stored in `Poppable`.
    typealias Element

    /// Returns true if `Poppable` is empty.
    var isEmpty: Bool { get }

    /// Returns the first element in `Poppable`, `nil` if empty.
    var first: Element? { get }

    /// Removes the first element in `Poppable` and returns it, `nil` if empty.
    mutating func popFirst() -> Element?
}