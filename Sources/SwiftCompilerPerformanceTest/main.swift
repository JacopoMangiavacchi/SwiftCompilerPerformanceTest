//
//  main.swift
//  TestLoop
//
//  Created by Jacopo Mangiavacchi on 6/20/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

import Foundation
import CTestLoop

func testLoop1(_ a: inout [Int64], _ tot: Int) -> Int64 {
    for i in 0..<tot {
        a[i] = 1
    }
    return a[tot/2]
}

func testLoop2(_ a: inout [Int64], _ tot: Int) -> Int64 {
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

func testLoop3(_ a: inout [Int64], _ tot: Int) -> Int64 {
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

func testLoop4(_ a: inout [Int64], _ tot: Int) -> Int64 {
    let size = MemoryLayout<Int64>.size

    if var p:UnsafeMutableRawPointer = UnsafeMutableRawPointer(mutating: a) {
        //let data = Data(bytes: p, count: tot * size)
        for _ in 0..<tot {
            p.storeBytes(of: 4, as: Int64.self)
            p += size
        }
    }

    return a[tot/2]
}

func testLoop5(_ a: inout [Int64], _ tot: Int) -> Int64 {
    let size = MemoryLayout<Int64>.size

    if var p:UnsafeMutableRawPointer = UnsafeMutableRawPointer(mutating: a) {
        //let data = Data(bytes: p, count: tot * size)
        let t = tot/10
        for _ in 0..<t {
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
            p.storeBytes(of: 5, as: Int64.self)
            p += size
        }
    }

    return a[tot/2]
}

func testLoop6(_ a: inout [Int64], _ tot: Int) -> Int64 {
    a.withUnsafeMutableBufferPointer { (cArray: inout UnsafeMutableBufferPointer<Int64>) -> () in
        test6(cArray.baseAddress, Int64(tot))
    }

    return a[tot/2]
}

func testLoop7(_ a: inout [Int64], _ tot: Int) -> Int64 {
    a.withUnsafeMutableBufferPointer { (cArray: inout UnsafeMutableBufferPointer<Int64>) -> () in
        test7(cArray.baseAddress, Int64(tot))
    }

    return a[tot/2]
}


var tot = 1000
if !CommandLine.arguments.isEmpty, let arg = Int(CommandLine.arguments[1]) {
    tot = arg
}

print(tot)

var a = [Int64](repeating: 0, count: tot)
var n:Int64 = 0
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

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop5(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop6(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")

startTime = CFAbsoluteTimeGetCurrent()
n = testLoop7(&a, tot)
timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
print("Time elapsed for loop\(n): \(String(format: "%f", timeElapsed)) s.")
