//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a single-ended container (e.g. stack/queue) where values are removed from the front.
public protocol Poppable {
    /// Value type stored in `Poppable`.
    typealias Element

    /// Returns true if `Poppable` is empty.
    var isEmpty: Bool { get }

    /// Returns the first value in `Poppable`, `nil` if empty.
    var first: Element? { get }

    /// Removes the first value in `Poppable` and returns it.
    mutating func removeFirst() -> Element
}
