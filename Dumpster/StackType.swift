//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Protocol for a LIFO container.
public protocol StackType : Poppable {
    /// Prepends `value` to the end of `StackType`.
    mutating func insertFirst(value: Element)
}
