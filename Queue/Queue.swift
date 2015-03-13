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

    // MARK: Properties

    /// Returns true if `Queue` is empty.
    public var isEmpty: Bool {
        return head == nil
    }

    /// Returns the element at the head of `Queue`, or `nil` if empty.
    public var first: T? {
        return head?.value
    }

    // MARK: Operations

    /// Appends an element to the end of `Queue`
    public mutating func enqueue(value: T) {
        let node = Node(value)
        if head == nil {
            head = node
        }

        tail?.next = node
        tail = node
    }

    /// Removes the first element in `Queue` and returns it, `nil` if empty.
    public mutating func dequeue() -> T? {
        let value = first
        head = head?.next
        return value
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

// MARK: SequenceType

extension Queue : SequenceType {
    typealias Generator = GeneratorOf<T>

    /// Create a `Generator` that can enumerate `Queue`
    public func generate() -> Generator {
        var node = head

        return Generator {
            if let value = node?.value {
                node = node!.next
                return value
            }
            return nil
        }
    }
}

// MARK: CollectionType

extension Queue : CollectionType {
    typealias Index = QueueIndex<T>

    public var startIndex: Index {
        return QueueIndex(head)
    }

    public var endIndex: Index {
        return QueueIndex(tail?.next)
    }

    public subscript(index: Index) -> T {
        return index.node!.value
    }
}

// MARK: ExtensibleCollectionType

extension Queue : ExtensibleCollectionType {
    /// Does nothing
    public mutating func reserveCapacity(amount: Int) {
    }

    /// Appends an element to the end of `Queue`
    public mutating func append(value: T) {
        self.enqueue(value)
    }

    /// Appends multiple elements to the end of `Queue`
    public mutating func extend<S: SequenceType where S.Generator.Element == T>(values: S) {
        map(values) { self.enqueue($0) }
    }
}

// MARK: QueueIndex

public struct QueueIndex<T> : ForwardIndexType {
    private let node: Node<T>?

    private init(_ node: Node<T>?) {
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

// MARK: Node

/// Singly-linked list of elements in the queue
private final class Node<T> {
    private let value: T
    private var next: Node<T>?

    private init(_ value: T) {
        self.value = value
    }
}
