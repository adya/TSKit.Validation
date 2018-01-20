/// Validates an url.
public class UrlValidator : PatternValidator {
    
    public enum ValidationError: Error, CustomStringConvertible {
        
        case missmatchUrl
        
        public var description: String {
            switch self {
            case .missmatchUrl: return "Not a valid URL"
            }
        }
    }
    
    public init() {
        super.init(pattern: "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+",
                   error: ValidationError.missmatchUrl)
    }
}
