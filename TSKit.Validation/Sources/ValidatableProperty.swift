/*
Generic wrapper containing a value and a set of `Validators` to validate it.
 - Version: 2.0
 - Since: 10/31/2016
 - Date: 12/25/2017
 - Author: Arkadiy Glushchevsky
 */
public struct ValidatableProperty<T> : Validatable {
    
    /// Stored value.
    public var value : T? {
        didSet {
            validate()
        }
    }
    
    /// Validators attached to this property.
    public let validators : [AnyValidator]
    
    /// Any validation errors occured during last value change.
    public private(set) var errors : [Error] = []
    
    /// Flag indicating whether this property has passed all validations or not.
    public var isValid : Bool {
        return errors.isEmpty
    }
    
    public init(value : T? = nil, validators : [AnyValidator]) {
        self.validators = validators
        self.value = value
        self.validate()
    }
    
    /// Performs validation and updates errors if any.
    @discardableResult private mutating func validate() -> Bool {
        errors = validators.filter { !$0.validate(self.value) }
                           .flatMap { $0.errors }
        return isValid
    }
}
