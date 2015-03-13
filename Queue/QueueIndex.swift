//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Index for a `Queue`
public struct QueueIndex<T> : ForwardIndexType {
    internal let node: Node<T>?

    internal init(_ node: Node<T>?) {
        self.node = node
    }

    public func successor() -> QueueIndex {
        return QueueIndex(self.node!.next)
    }
}

// Compares for equality via pointer identity
public func == <T> (lhs: QueueIndex<T>, rhs: QueueIndex<T>) -> Bool {
    return lhs.node === rhs.node
}
