/// A type that has a countable sequence of elements.
public protocol Countable {

    /// Count of elements.
    var count: Int { get }
}

extension Array: Countable {}

extension Set: Countable {}

extension Dictionary: Countable {}

extension String: Countable {}
