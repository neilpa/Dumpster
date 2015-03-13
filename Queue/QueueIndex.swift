//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Index for a `Queue`
public struct QueueIndex<T> : ForwardIndexType {
    /// Current `node` that `QueueIndex` points at.
    internal let node: Node<T>?

    /// The node before `node`, used for creating slices.
    internal let previous: Node<T>?

    /// The `last` node this index can increment through, i.e. this is the
    /// predecessor to `Queue.endIndex`.
    private let last: Node<T>?

    /// Create a `start` index at `node`.
    internal init(node: Node<T>?, last: Node<T>?) {
        previous = nil
        self.node = node
        self.last = last
    }

    /// Create an index at `previous.next`.
    internal init(previous: Node<T>?, last: Node<T>?) {
        self.previous = previous
        node = previous?.next
        self.last = last
    }

    /// Returns the next `QueueIndex`.
    public func successor() -> QueueIndex {
        precondition(node !== last?.next, "Cannot increment past endIndex")
        return QueueIndex(previous: node!, last: last)
    }
}

// Compares for equality via pointer identity.
public func == <T> (lhs: QueueIndex<T>, rhs: QueueIndex<T>) -> Bool {
    return lhs.node === rhs.node
}
