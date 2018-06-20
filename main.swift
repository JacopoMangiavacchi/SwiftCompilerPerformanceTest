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

let tot = 1000
var a = [Int](repeating: 0, count: tot)

let m = testLoop1(&a, tot)
print(m)

let n = testLoop2(&a, tot)
print(n)

let o = testLoop3(&a, tot)
print(o)
