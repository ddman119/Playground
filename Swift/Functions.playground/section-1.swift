// Functions

import Foundation

// Try out a function with no parameters or return value:

func boringFunction() {
    println("This function is boring.")
}

boringFunction()

// Try out a basic string concatenation function:

func sayHello(name: String) -> String {
    let greeting = "Hello, " + name + "!"
    return greeting
}

sayHello("Sam")

// Try out a basic sum function:

func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(1, 2)

// Try out a function with a tuple return value:

func firstLast<T>(array: [T]) -> (first: T, last: T) {
    return (array.first!, array.last!)
}

firstLast([1, 2, 3])