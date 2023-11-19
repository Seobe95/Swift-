//
//  대충만든지판.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 2023/09/26.
//
// 배열 내 딕셔너리(자판)를 넣고, 딕셔너리에 문자를 key, 입력 횟수(문자 index)를 저장.
// 타겟의 문자를 각 딕셔너리의 키값으로 넣어 value를 얻게 되면 그게 바로 입력 횟수. 각 자판마다 가장 작은 딕셔너리를 넣으면 될듯
// https://school.programmers.co.kr/learn/courses/30/lessons/160586


import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
  var keyboardArr: [[String : Int]] = []
  var answer: [Int] = []
  
  let keymap = keymap.map { return Array($0) }
  let targets = targets.map { return Array($0) }
  
  for (index, item) in keymap.enumerated() {
    keyboardArr.append([:])
    for (j, str) in item.enumerated() {
      if keyboardArr[index][String(str)] == nil {
        keyboardArr[index][String(str)] = j + 1
      }
    }
  }
  
  targets.forEach { targetString in
    var arr: [Int] = []
    targetString.forEach { str in
      var countArr: [Int] = []
      for index in 0..<keyboardArr.count {
        let count = keyboardArr[index][String(str)] ?? 0
        count > 0 ? countArr.append(count) : nil
      }
      arr.append(countArr.isEmpty ? 0 : countArr.min()!)
    }
    let result = arr.contains(0) ? -1 : arr.reduce(0) { $0 + $1 }
    answer.append(result)
  }

  return answer
}
