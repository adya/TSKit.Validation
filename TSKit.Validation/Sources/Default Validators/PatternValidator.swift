import Foundation
import TSKit_Core

public class PatternValidator: AnyValidator {

    let pattern: String

    public let errors: [Error]

    public init(pattern: String, error: Error) {
        self.pattern = pattern
        self.errors = [error]
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
