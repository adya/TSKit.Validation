import TSKit_Log

/**
 Defines ViewModel which will have ValidatableProperties.
 ### Common usage example:
 ```
    protocol SomeViewModel : AnyValidatableViewModel {
        var property : ValidatableProperty<String> {get set}
        var nestedViewModel : AnyValidatableViewModel {get}

        /// other properties...
 
        var validatables: [Validatable] {
            return [self.property, self.nestedViewModel] // Any other properties which you want to be valid.
        }
    }
 ```
 */
public protocol AnyValidatableViewModel : Validatable, Loggable {
    
    /// A flag indicating whether or not view model's `Validatable` properties are all valid.
    /// - Returns: `true` if all `validatables` have passed validation.
    var isValid : Bool {get}
    
    /// An array of `self`'s validatable properties that must be validated to determine ViewModel as valid.
    var validatables : [Validatable] {get}
}

/// Defines default ViewModel validation algorithm via `validatables` property.
public extension AnyValidatableViewModel {
    
    var isValid: Bool {
        let failedValidatables = validatables.filter { !$0.isValid }
        if !failedValidatables.isEmpty {
            let errors = failedValidatables.flatMap { $0.errors }
                                           .map { $0.localizedDescription }
                                           .joined(separator: ",\n")
            log.debug("Failed with errors: \(errors).")
        }
        return failedValidatables.isEmpty
    }
    
    var errors: [Error] {
        return validatables.filter { $0.isValid }
                           .flatMap { $0.errors }
    }
}
