//
//  main.swift
//  Functions
//
//  Created by Mehmet Tarhan on 07/03/2022.
//

import Foundation

func sum(_ x: Int, _ y: Int) -> Int {
    let result = x + y
    return result
}

let x = 4
let y = 5
let z = sum(x, y)
// print(z)

// MARK: - Void Return Type and Parameters

func say1(_ s: String) { print(s) }
func say2(_ s: String) { print(s) }
func say3(_ s: String) { print(s) }

// MARK: - A function without any parameters

func greet() -> String { return "howdy" }

// MARK: - Overloading

/*
    Function overloading is legal (and common). This means that two functions with exactly the same name, including their external parameter names, can coexist as long as they have different signatures. (Two functions with the same base name but different external parameter names do not constitute a case of overloading; they are simply two different functions with two different names.)
 */

// These two functions can coexist:
func say(_ what: String) {}
func say(_ what: Int) {}

// and also these can coexist
func say() -> String { return "one" }
func say() -> Int { return 1 }

// let result = say() // compile error
let sayString: String = say()
let sayInt: Int = say()

let result = say() + "two"

// MARK: - Default Parameter Values

class Dog {
    func say(_ s: String, times: Int = 1) {
        for _ in 1 ... times {
            print(s)
        }
    }
}

let d = Dog()
//d.say("woof")
//d.say("meow", times: 2)

// MARK: - Variadic Parameters

/*
 A parameter can be variadic. This means that the caller can supply as many argument values of this parameter’s type as desired, separated by a comma; the function body will receive these values as an array.
 */

func sayStrings(_ array: String ...) {
    array.forEach { print($0) }
}

sayStrings("hey", "ho", "nonny nonny no")

// MARK: - Modifiable Parameters
/*
 If we want a function to alter the original value of an argument passed to it, we must do the following:

    - The type of the parameter we intend to modify must be declared inout.
    - When we call the function, the variable holding the value to be modified must be declared with var, not let.
    - Instead of passing the variable as an argument, we must pass its address. This is done by preceding its name with an ampersand (&).
 */
/*
 When a function with an inout parameter is called, the variable whose address was passed as argument to that parameter is always set, even if the function makes no changes to that parameter.
 */
func removeCharacter(_ c: Character, from s: inout String) -> Int {
    var howMany = 0
    while let ix = s.firstIndex(of: c) {
        s.remove(at: ix)
        howMany += 1
    }
    
    return howMany
}

var string = "Swift"
let _ = removeCharacter("t", from: &string)
print(string)

