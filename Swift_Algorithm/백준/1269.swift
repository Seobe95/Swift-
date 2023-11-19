//
//  main.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 11/19/23.
//

import Foundation

let input = readLine()!.split(separator: " ")
let (a, b) = (Int(input[0])!, Int(input[1])!)
var setA: Set<Int> = []
var setB: Set<Int> = []

readLine()!.split(separator: " ").forEach { setA.insert(Int($0)!) }
readLine()!.split(separator: " ").forEach { setB.insert(Int($0)!) }

let ASubtractingB = setA.subtracting(setB)
let BSubtractingA = setB.subtracting(setA)

print(ASubtractingB.count + BSubtractingA.count)
