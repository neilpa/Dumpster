//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Generic FIFO queue
public struct Queue<T> : QueueType {
    // MARK: Constructors

    /// Initializes an empty `Queue`
    public init() {
    }

    /// Initializes a `Queue` with a single `value`
    public init(_ value: T) {
        let node = Node(value)
        self.init(head: node, tail: node)
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

        // Explicitly check against tail rather than waiting for head to be
        // nil since this could be a sub-slice of a larger queue.
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }

        return value
    }

    // MARK: Private

    /// Initialize with an explicit `head` and `tail` (e.g. from a slice)
    private init(head: Node<T>, tail: Node<T>) {
        self.head = head
        self.tail = tail
    }

    /// First element in the `Queue`
    private var head: Node<T>?

    /// Last element in the `Queue`
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

    /// Index to the first element of `Queue`
    public var startIndex: Index {
        return QueueIndex(node: head)
    }

    /// Index past the last element of `Queue`
    public var endIndex: Index {
        return QueueIndex(previous: tail)
    }

    /// Returns the element in `Queue` at `index`
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

// MARK: Sliceable

extension Queue : Sliceable {
    typealias SubSlice = Queue<T>

    /// Extract a slice of `Queue`
    public subscript(range: Range<Index>) -> SubSlice {
        let tail = range.endIndex.previous ?? self.tail!
        return Queue(head: range.startIndex.node!, tail: tail)
    }
}
