/// Validates number only.
public class NumbersValidator : PatternValidator {
    
    public enum ValidationError: Error, CustomStringConvertible {
        
        case missmatchNumbers
        
        public var description: String {
            switch self {
            case .missmatchNumbers: return "String contains non-numeric characters"
            }
        }
    }
    
    public init() {
        super.init(pattern: "\\d+",
                   error: ValidationError.missmatchNumbers)
    }
}
