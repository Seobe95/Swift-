//
//  main.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 11/19/23.
//

import Foundation

let input = readLine()!.split(separator: " ")
let (n, m) = (Int(input[0])!, Int(input[1])!)

var poketmonArr: [String : Int] = [:]
var poketmonArr2: [Int : String] = [:]
for index in 1...n {
    let poketmon = readLine()!
    poketmonArr[poketmon] = index
    poketmonArr2[index] = poketmon
}

for _ in 1...m {
    let question = readLine()!
    if let number = Int(question) {
        print( poketmonArr2[number]! )
    } else {
        print( poketmonArr[question]! )
    }
}
