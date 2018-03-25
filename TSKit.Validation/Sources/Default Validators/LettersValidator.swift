import Foundation

/// Validates letters only.
public class LettersValidator : PatternValidator {
  
    public enum ValidationError: String, LocalizedError {
        
        case missmatchLetters = "String contains non-letter characters"
        
        public var description: String {
            return rawValue
        }
    }
    
    public init() {
        super.init(pattern: "[a-zA-Z]+",
                   error: ValidationError.missmatchLetters)
    }
}
