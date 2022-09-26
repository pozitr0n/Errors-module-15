import UIKit
import PlaygroundSupport
import Foundation

// Creating an enumeration with stored errors
enum HTTPErrors: Error {
    case error400 // bad, invalid request
    case error404 // not found
    case error500 // internal server error
}

// Throwing Error Handling Function
func errorHandlingHTTP() throws {
    if errorType == 400 {
        throw HTTPErrors.error400
    }
    if errorType == 404 {
        throw HTTPErrors.error404
    }
    if errorType == 500 {
        throw HTTPErrors.error500
    }
}

// For example get the value 400
var errorType: Int = 400

do {
    try errorHandlingHTTP()
} catch HTTPErrors.error400 {
    print("Error of HTTP: bad, invalid request")
} catch HTTPErrors.error404 {
    print("Error of HTTP: not found")
} catch HTTPErrors.error500 {
    print("Error of HTTP: internal server error")
}

// ================================================================
// The input parameter is a value.
// And then its type is already compared.
// Writing the type itself as a parameter is somehow not very good.
// ================================================================

// Function for checking the types of input values
func checkingValueTypes<GenType1: Equatable,
                            GenType2: Equatable>(valueFirst: GenType1, valueSecond: GenType2) -> String {
    
    var valueReturn: String = ""
    
    if type(of: valueFirst) == type(of: valueSecond) {
        valueReturn = "Yes"
    } else {
        valueReturn = "No"
    }
   
    // Service printing
    // print(type(of: valueFirst))
    // print(type(of: valueSecond))
    
    return valueReturn
    
}

// Service values (tests)
var valTest1: Int = 5
var valTest2: Double = 10.5
var valTest3: String = "10"
var valTest4: Bool = false
var valTest5: Int = 15

print(checkingValueTypes(valueFirst: valTest1, valueSecond: valTest5))

enum errorsTypes: Error {
    case sameTypes // types are the same
    case differentTypes // types are different
}

// Throwing Error Handling Function
func errorTypesHandling<GType1: Equatable,
                        GType2: Equatable>(valFirst: GType1, valSecond: GType2) throws {
    
    if type(of: valFirst) == type(of: valSecond) {
        throw errorsTypes.sameTypes
    } else {
        throw errorsTypes.differentTypes
    }

}

// Function for checking the types of input values
func checkingValueTypesWithTryCatch<GenType1: Equatable,
                            GenType2: Equatable>(valueFirst: GenType1, valueSecond: GenType2) -> String {
    
    var valueReturn: String = ""
    
    do {
        try errorTypesHandling(valFirst: valueFirst, valSecond: valueSecond)
    } catch errorsTypes.sameTypes {
        
        valueReturn = "Yes"
        print("The parameter's types are the same.")
        
    } catch errorsTypes.differentTypes {
        
        valueReturn = "No"
        print("The parameter's types are different.")
        
    // An additional condition block has been added to fix the following compilation error:
    // == Errors thrown from here are not handled ==
    } catch {
        print("Another error...")
    }
    
    return valueReturn
    
}

// Service values (tests another one...)
var valTest1_another: Int = 5
var valTest2_another: Double = 10.5
var valTest3_another: String = "10"
var valTest4_another: Bool = false
var valTest5_another: Int = 15

print(checkingValueTypesWithTryCatch(valueFirst: valTest1_another, valueSecond: valTest5_another))

enum errorsValues: Error {
    case sameValues // values are the same
    case differentValues // values are different
}

// Throwing Error Handling Function
func errorValuesHandling<G_Type1: Equatable,
                        G_Type2: Equatable>(valFirst: G_Type1, valSecond: G_Type2) throws {
    
    if type(of: valFirst) == type(of: valSecond) {
        if valFirst == valSecond as! G_Type1 {
            throw errorsValues.sameValues
        } else {
            throw errorsValues.differentValues
        }
    } else {
        throw errorsValues.differentValues
    }

}

// Function for checking the input values
func checkingValueWithTryCatch<Gen_Type1: Equatable,
                            Gen_Type2: Equatable>(valueTheFirst: Gen_Type1, valueTheSecond: Gen_Type2) -> String {
    
    var finalResult: String = ""
    
    do {
        try errorValuesHandling(valFirst: valueTheFirst, valSecond: valueTheSecond)
    } catch errorsValues.sameValues {
        
        finalResult = "Yes"
        print("The values are the same.")
        
    } catch errorsValues.differentValues {
        
        finalResult = "No"
        print("The values are different.")
        
    // An additional condition block has been added to fix the following compilation error:
    // == Errors thrown from here are not handled ==
    } catch {
        print("Another error...")
    }
    
    return finalResult
    
}

// Service values (tests another one and one...)
var valTest1_another1: Int = 5
var valTest2_another1: Double = 10.5
var valTest3_another1: String = "10"
var valTest4_another1: Bool = false
var valTest5_another1: Int = 6

print(checkingValueWithTryCatch(valueTheFirst: valTest1_another1, valueTheSecond: valTest5_another1))
