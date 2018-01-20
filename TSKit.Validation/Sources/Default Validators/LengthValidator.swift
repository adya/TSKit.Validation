/// - Parameter String: Validates `String`'s length.
/// - Parameter Array: Validates `Array`'s size.
/// - Parameter Set: Validates `Set`'s size.
/// - Parameter Dictionary: Validates `Dictionary`'s size.
/// - Parameter Countable: Validates count of any `Countable`.
public class LengthValidator : ValueValidator<Int> {
    
    public override class var defaultValueName: String {
        return "length"
    }
    
    public override func canValidate(_ value: Any?) -> Bool {
        return value is Countable
    }
    
    public override func validate(_ value: Any?) -> Bool {
        guard let countable = value as? Countable else {
            return true
        }
        return super.validate(countable.count)
    }
}

