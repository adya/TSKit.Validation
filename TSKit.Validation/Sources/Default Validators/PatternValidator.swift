import Foundation
import TSKit_Core
    
public class PatternValidator : AnyValidator {
    
    public enum ValidationError: LocalizedError {
        
        /// Value doesn't match the pattern.
        case missmatch(pattern: String)
        
        public var description: String {
            switch self {
            case let .missmatch(pattern): return "Does not match '\(pattern)' pattern"
            }
        }
    }

    let pattern : String
    
    public let errors: [Error]
    
    public init(pattern : String, error: Error? = nil) {
        self.pattern = pattern
        self.errors = [error ?? ValidationError.missmatch(pattern: pattern)]
    }
    
    public func canValidate(_ value: Any?) -> Bool {
        return value is CustomStringConvertible
    }
    
    public func validate(_ value: Any?) -> Bool {
        guard let value = value as? CustomStringConvertible else {
            return true
        }
        return value.description =~ self.pattern
    }
}
