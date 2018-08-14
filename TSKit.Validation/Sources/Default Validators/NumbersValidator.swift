import Foundation

/// Validates number only.
public class NumbersValidator: PatternValidator {

    public enum ValidationError: String, Error {

        case mismatchNumbers = "String contains non-numeric characters"

        public var description: String {
            return rawValue
        }
    }

    public init() {
        super.init(pattern: "\\d+",
                   error: ValidationError.mismatchNumbers)
    }
}
