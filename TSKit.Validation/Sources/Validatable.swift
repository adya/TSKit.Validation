/**
 A type that can be validated by `AnyValidator`s and represent validation results.
 - Version: 2.0
 - Since: 10/31/2016
 - Date: 12/25/2017
 - Author: Arkadiy Glushchevsky
 */
public protocol Validatable {
    
    /// A flag indicating whether or not `Validatable` is valid.
    var isValid : Bool {get}
    
    /// Errors occurred after validation of `Validatable`.
    var errors : [Error] {get}
}
