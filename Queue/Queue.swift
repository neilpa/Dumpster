//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Generic FIFO queue
public struct Queue<T> : QueueType {
    // MARK: Constructors

    /// Initializes an empty `Queue`
    public init() {
    }

    /// Initializes a `Queue` with a single `value`
    public init(_ value: T) {
        head = Node(value)
    }

    /// Initializes a `Queue` with a sequence of `values`
    public init<S: SequenceType where S.Generator.Element == T>(_ values: S) {
        map(values) { self.enqueue($0) }
    }

    /// Appends an element to the end of `Queue`
    public mutating func enqueue(value: T) {
        let tail = Node(value)
        if head == nil {
            head = tail
        }

        self.tail?.next = tail
        self.tail = tail
    }

    /// Removes the first element in `Queue` and returns it, `nil` if empty.
    public mutating func dequeue() -> T? {
        let value = peek()
        head = head?.next
        return value
    }

    /// Returns the element at the head of `Queue`, or `nil` if empty.
    public func peek() -> T? {
        return head?.value
    }

    // MARK: Private

    private var head: Node<T>?
    private var tail: Node<T>?
}

// MARK: ArrayLiteralConvertible

extension Queue : ArrayLiteralConvertible {
    /// Initializes a `Queue` with the `elements` from array
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

/// Singly-linked list of elements in the queue
private final class Node<T> {
    let value: T
    var next: Node<T>?

    init(_ value: T) {
        self.value = value
    }
}
