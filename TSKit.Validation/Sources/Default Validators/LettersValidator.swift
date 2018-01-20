/// Validates letters only.
public class LettersValidator : PatternValidator {
  
    public enum ValidationError: Error, CustomStringConvertible {
        
        case missmatchLetters
        
        public var description: String {
            switch self {
            case .missmatchLetters: return "String contains non-letter characters"
            }
        }
    }
    
    public init() {
        super.init(pattern: "[a-zA-Z]+",
                   error: ValidationError.missmatchLetters)
    }
}
