//  Copyright (c) 2015 Neil Pankey. All rights reserved.

public struct Queue<T> : QueueType {
    private var head: Node<T>?
    private var tail: Node<T>?

    public mutating func enqueue(value: T) {
        let tail = Node(value)
        self.tail?.next = tail
        self.tail = tail
    }

    public mutating func dequeue() -> T? {
        let value = peek()
        head = head?.next
        return value
    }

    public func peek() -> T? {
        return head?.value
    }
}

private final class Node<T> {
    let value: T
    var next: Node<T>?

    init(_ value: T) {
        self.value = value
    }
}
