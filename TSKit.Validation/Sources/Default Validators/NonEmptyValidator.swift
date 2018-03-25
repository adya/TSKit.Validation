/// Requires value to be not empty.
/// - Parameter String: Validates non empty `String`.
/// - Parameter Array: Validates non empty `Array`.
/// - Parameter Set: Validates non empty `Set`.
/// - Parameter Dictionary: Validates non empty `Dictionary`.
/// - Parameter Countable: Any type which conformes to `Countable` protocol.
public class NonEmptyValidator : AnyValidator {
    
    public var errors: [Error] = []
    
    public func canValidate(_ value: Any?) -> Bool {
        return value is Countable
    }
    
    public func validate(_ value: Any?) -> Bool {
        guard let value = value as? Countable else {
            return true
        }
        
        return value.count > 0
    }
    
    public init() {}
    
}
