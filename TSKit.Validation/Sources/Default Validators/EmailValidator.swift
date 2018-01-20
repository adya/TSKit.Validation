/// Validates an email.
public class EmailValidator : PatternValidator {
    
    public enum ValidationError: Error, CustomStringConvertible {
        
        case missmatchEmail
        
        public var description: String {
            switch self {
            case .missmatchEmail: return "Not a valid email"
            }
        }
    }
    
    public init() {
        super.init(pattern: "([A-Z0-9a-z._%+-]+)@(?:([A-Za-z0-9-]+)\\.)+([A-Za-z]{2,6})",
                   error: ValidationError.missmatchEmail)
    }
}
