// Array decomposing
//
// http://www.objc.io/snippets/1.html

import Foundation

extension Array {
    var decompose : (head: T, tail: [T])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

let testArray = [1, 2, 3, 4, 5]
let decomposedArray = testArray.decompose!

let head = decomposedArray.head
let tail = decomposedArray.tail