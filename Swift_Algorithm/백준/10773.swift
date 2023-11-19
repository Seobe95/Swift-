//
//  main.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 11/19/23.
//

import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []

for _ in 1...n {
    let input = Int(readLine()!)!
    switch input {
    case 0:
        stack.removeLast()
    default:
        stack.append(input)
    }
}

print(stack.reduce(0, { $0 + $1 }))
