import Foundation

/// Validates number only.
public class NumbersValidator : PatternValidator {
    
    public enum ValidationError: String, LocalizedError {
        
        case missmatchNumbers = "String contains non-numeric characters"
        
        public var description: String {
            return rawValue
        }
    }
    
    public init() {
        super.init(pattern: "\\d+",
                   error: ValidationError.missmatchNumbers)
    }
}
