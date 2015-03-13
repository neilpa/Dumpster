//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Singly-linked list of elements in `Queue`
internal final class Node<T> {
    internal let value: T
    internal var next: Node?

    internal init(_ value: T) {
        self.value = value
    }
}

extension Node : SequenceType {
    typealias Generator = GeneratorOf<Node>

    func generate() -> Generator {
        var node: Node? = self

        return Generator {
            let current = node
            node = current?.next
            return current
        }
    }
}
