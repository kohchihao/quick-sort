#!/usr/bin/swift

import Foundation

/// Simple solution
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

final class Tests {
    
    static func run() {
        let tests = Tests()
        tests.testQucksortArray()
    }
    
    func testQucksortArray() {
        let array = [1,99,2,98,3,97,4,96,4,95,5,94]
        let ans_array = [1, 2, 3, 4, 4, 5, 94, 95, 96, 97, 98, 99]
        let result = quicksort(array)
        assertEqual(ans_array, result)
    }
    
    func assertEqual<T: Comparable>(_ a1: [T], _ a2: [T]) {
        if a1 != a2 {
            print("\(a1) not equal to \(a2)")
        } else {
            print("Ok...")
        }
    }
}

Tests.run()
print("Done...")
