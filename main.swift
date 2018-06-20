//
//  main.swift
//  TestLoop
//
//  Created by Jacopo Mangiavacchi on 6/20/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

import Foundation

func testLoop1(_ a: inout [Int], _ tot: Int) -> Int {
    for i in 0..<tot {
        a[i] = 1
    }
    return a[tot/2]
}

func testLoop2(_ a: inout [Int], _ tot: Int) -> Int {
    for i in 0..<tot/10 {
        let start = i*10
        a[start] = 2
        a[start+1] = 2
        a[start+2] = 2
        a[start+3] = 2
        a[start+4] = 2
        a[start+5] = 2
        a[start+6] = 2
        a[start+7] = 2
        a[start+8] = 2
        a[start+9] = 2
    }
    return a[tot/2]
}

func testLoop3(_ a: inout [Int], _ tot: Int) -> Int {
    let t = tot/10
    for i in 0..<t {
        let start = i*10
        a[start] = 3
        a[start+1] = 3
        a[start+2] = 3
        a[start+3] = 3
        a[start+4] = 3
        a[start+5] = 3
        a[start+6] = 3
        a[start+7] = 3
        a[start+8] = 3
        a[start+9] = 3
    }
    return a[tot/2]
}

func testLoop4(_ a: inout [Int], _ tot: Int) -> Int {
    let size = MemoryLayout<Int>.size

    if var p:UnsafeMutableRawPointer = UnsafeMutableRawPointer(mutating: a) {
        //let data = Data(bytes: p, count: tot * size)
        for _ in 0..<tot {
            p.storeBytes(of: 4, as: Int.self)
            p += size
        }
    }

    return a[tot/2]
}




var tot = 1000
if !CommandLine.arguments.isEmpty, let arg = Int(CommandLine.arguments[1]) {
    tot = arg
}

print(tot)

var a = [Int](repeating: 0, count: tot)
var n = 0
var startTime = 0.0
var timeElapsed = 0.0

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop1(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop2(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop3(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop4(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

