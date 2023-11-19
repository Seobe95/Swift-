//
//  main.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 10/20/23.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
  var XDictionary: [String : Int] = [:]
  var YDictionary: [String : Int] = [:]
  var result: String = ""
  
  for item in X {
    let str = String(item)
    let x = XDictionary[str] ?? 0
    XDictionary[str] = x + 1
  }
  
  for item in Y {
    let str = String(item)
    let y = YDictionary[str] ?? 0
    YDictionary[str] = y + 1
  }
  
  for key in XDictionary.keys {
    let xIndex = XDictionary[key] ?? 0
    let yIndex = YDictionary[key] ?? 0
    var minIndex = min(xIndex, yIndex)
    
    for _ in 0..<minIndex {
      result += key
    }
  }
  
  result = String(result.sorted(by: >))
  
  if result == "" { return "-1"}
  if result.first! == "0" { return "0"}
  return result
}

solution("5525", "1255")


