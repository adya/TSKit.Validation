/// - Parameter Comparable: Validates any `Comparable` values.
public class ValueValidator<ValueType : Comparable> : AnyValidator {
    
    /// Default name identyfing validatable `value`.
    class var defaultValueName: String {
        return "value"
    }
    
    /// Comparison bound of the value.
    public struct Bound: Comparable {
        
        /// Type of the `Bound`.
        public enum Kind {
            
            /// Value is not included in valid range.
            case exclusive
            
            /// Value is included in valid range.
            case inclusive
            
        }
        
        /// Boundary value.
        public let value: ValueType
        
        /// Type of the `Bound`
        public let kind: Bound.Kind
        
        static func inclusive(_ value: ValueType) -> Bound {
            return Bound(value: value, kind: .inclusive)
        }
        
        static func exclusive(_ value: ValueType) -> Bound {
            return Bound(value: value, kind: .exclusive)
        }
    }
    
    public typealias BoundRange = (Bound?, Bound?)
    
    public enum Errors: Error {
        
        case lessThan(BoundRange)
        
        case greaterThan(BoundRange)
        
        case notEqual(ValueType)
    }
    
    private let lowerBound: Bound?
    private let upperBound: Bound?
    private var valueName: String = ""
    
    public var errors: [Error] = []
    
    public init(lowerBound : Bound, valueName: String? = nil) {
        self.lowerBound = lowerBound
        self.upperBound = nil
        self.valueName = valueName ?? type(of: self).defaultValueName
    }
    
    public init(upperBound : Bound, valueName: String? = nil) {
        self.lowerBound = nil
        self.upperBound = upperBound
        self.valueName = valueName ?? type(of: self).defaultValueName
    }
    
    public init(lowerBound : Bound, upperBound : Bound, valueName: String? = nil) {
        self.lowerBound = min(lowerBound, upperBound)
        self.upperBound = max(lowerBound, upperBound)
        self.valueName = valueName ?? type(of: self).defaultValueName
    }
    
    public init(exactValue : ValueType, valueName : String? = nil) {
        let bound = Bound.inclusive(exactValue)
        self.lowerBound = bound
        self.upperBound = bound
        self.valueName = valueName ?? type(of: self).defaultValueName
    }
    
    public convenience init(upperValue : ValueType, valueName: String? = nil) {
        self.init(upperBound: .inclusive(upperValue), valueName: valueName)
    }
    
    public convenience init(lowerValue : ValueType, valueName: String? = nil) {
        self.init(lowerBound: .inclusive(lowerValue), valueName: valueName)
    }
    
    public convenience init(lowerValue : ValueType,
                            upperValue : ValueType,
                            valueName: String? = nil) {
        self.init(lowerBound: .inclusive(lowerValue),
                  upperBound: .inclusive(upperValue),
                  valueName: valueName)
    }
    
    public convenience init(lowerBound : Bound,
                            upperValue : ValueType,
                            valueName: String? = nil) {
        self.init(lowerBound: lowerBound,
                  upperBound: .inclusive(upperValue),
                  valueName: valueName)
    }
    
    public convenience init(lowerValue : ValueType,
                            upperBound : Bound,
                            valueName: String? = nil) {
        self.init(lowerBound: .inclusive(lowerValue),
                  upperBound: upperBound,
                  valueName: valueName)
    }
    
    public func canValidate(_ value: Any?) -> Bool {
        return value is ValueType
    }
    
    public func validate(_ value : Any?) -> Bool {
        guard let valueT = value as? ValueType else {
            return true
        }
        let inLowerBound = self.lowerBound.flatMap {
            switch $0.kind {
            case .exclusive: return $0.value < valueT
            case .inclusive: return $0.value <= valueT
            }
            } ?? true
        
        let inUpperBound = self.upperBound.flatMap {
            switch $0.kind {
            case .exclusive: return valueT < $0.value
            case .inclusive: return valueT <= $0.value
            }
            } ?? true
        
        let isExactValue = lowerBound?.value == upperBound?.value
        
        if isExactValue {
            let isValid = inLowerBound && inUpperBound
            guard let value = lowerBound?.value else {
                return false
            }
            if !isValid {
                errors = [Errors.notEqual(value)]
            }
        } else {
            if !inLowerBound {
                errors = [Errors.lessThan((lowerBound, upperBound))]
            } else if !inUpperBound {
                errors = [Errors.greaterThan((lowerBound, upperBound))]
            }
        }
        return inLowerBound && inUpperBound
    }
}

public func <<T>(_ x : ValueValidator<T>.Bound, _ y : ValueValidator<T>.Bound) -> Bool {
    return x.value < y.value
}

public func ==<T>(_ x : ValueValidator<T>.Bound, _ y : ValueValidator<T>.Bound) -> Bool {
    return x.value == y.value
}
