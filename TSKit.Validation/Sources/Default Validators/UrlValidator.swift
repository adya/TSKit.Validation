import Foundation

/// Validates an url.
public class UrlValidator : PatternValidator {
    
    public enum ValidationError: String, LocalizedError {
        
        case missmatchUrl = "Not a valid URL"
        
        public var description: String {
            return rawValue
        }
    }
    
    public init() {
        super.init(pattern: "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+",
                   error: ValidationError.missmatchUrl)
    }
}
