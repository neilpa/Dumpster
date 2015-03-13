//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Index for a `Queue`
public struct QueueIndex<T> : ForwardIndexType {
    /// Current `node` that `QueueIndex` points to
    internal let node: Node<T>?

    /// The node before `node`, used for creating slices.
    internal let previous: Node<T>?

    /// Create an index at `node`
    internal init(node: Node<T>?) {
        self.node = node
        previous = nil
    }

    /// Create an index at `previous.next`.
    internal init(previous: Node<T>?) {
        self.previous = previous
        node = previous?.next
    }

    /// Returns the next `QueueIndex`
    public func successor() -> QueueIndex {
        return QueueIndex(previous: self.node!)
    }
}

// Compares for equality via pointer identity
public func == <T> (lhs: QueueIndex<T>, rhs: QueueIndex<T>) -> Bool {
    return lhs.node === rhs.node
}
