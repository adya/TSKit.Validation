/// Requires value to be not `nil`.
/// - Parameter Any: Accepts any values.
public class NilValidator : AnyValidator {
    
    public enum ValidationError: Error, CustomStringConvertible {
        
        /// Value is `nil`.
        case empty
        
        public var description: String {
            switch self {
            case .empty: return "Value is `nil`"
            }
        }
    }
    
    public init() {}
    
    public let errors: [Error] = [ValidationError.empty]
    
    public func canValidate(_ value: Any?) -> Bool {
        return true
    }
    
    public func validate(_ value: Any?) -> Bool {
        return value != nil
    }
}
