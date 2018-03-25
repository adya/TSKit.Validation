import Foundation

/// Validates an email.
public class EmailValidator : PatternValidator {
    
    public enum ValidationError: String, LocalizedError {
        
        case missmatchEmail = "Not a valid email"
        
        public var description: String {
            return rawValue
        }
    }
    
    public init() {
        super.init(pattern: "([A-Z0-9a-z._%+-]+)@(?:([A-Za-z0-9-]+)\\.)+([A-Za-z]{2,6})",
                   error: ValidationError.missmatchEmail)
    }
}
