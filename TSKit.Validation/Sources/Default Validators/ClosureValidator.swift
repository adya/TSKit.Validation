public class ClosureValidator<T> : AnyValidator {
    
    public let errors: [Error]
    
    public let closure : (T?) -> Bool
    
    public init(error : Error, closure : @escaping (T?) -> Bool) {
        self.closure = closure
        self.errors = [error]
    }
    
    public func canValidate(_ value: Any?) -> Bool {
        return value is T
    }
    
    public func validate(_ value: Any?) -> Bool {
        guard let value = value as? T else {
            return true
        }
        return self.closure(value)
    }
}
