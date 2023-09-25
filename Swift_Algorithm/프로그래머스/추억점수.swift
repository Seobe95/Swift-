//
//  추억점수.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 2023/09/25.
//

import Foundation

/* https://school.programmers.co.kr/learn/courses/30/lessons/176963?language=swift */
func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
  var tempDictionary: [String:Int] = [:]
  var answer: [Int] = []
  
  for index in 0..<name.count {
    tempDictionary[name[index]] = yearning[index]
  }
  
  for nameArr in photo {
    var score = 0
    for name in nameArr {
      if let memoryScore = tempDictionary[name] {
        score += memoryScore
      }
    }
    answer.append(score)
  }
  
  return answer
}
