import Foundation

func areIntsEqual(a: Int, b: Int) -> Bool { return a == b }
func areValuesEqual<T: Equatable>(a: T, b: T) -> Bool { return a == b }

areIntsEqual(1, 1)
