// Number Manipulation

//
// MARK: - Binary literals and operations
//

let first = 0b01011
let second = 0b00110

// XOR:

let xor = (first ^ second)
String(xor, radix: 2)

// OR:

let or = (first | second)
String(or, radix: 2)

// Using bitwise assignment operators:

var bitwiseAssignment = 0b1101
bitwiseAssignment ^= 0b0110