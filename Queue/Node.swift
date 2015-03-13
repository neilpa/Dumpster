//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Singly-linked list of elements in `Queue`
internal final class Node<T> {
    internal let value: T
    internal var next: Node<T>?

    internal init(_ value: T) {
        self.value = value
    }
}
