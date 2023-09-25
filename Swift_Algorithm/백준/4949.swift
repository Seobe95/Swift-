//
//  4949.swift
//  https://www.acmicpc.net/problem/4949
//

import Foundation

func solution() {
  var answer: [String] = []

  while(true) {
    let input = readLine()!
    if input == "." {
      break
    }
    
    let arr: [Character] = ["(", ")", "[", "]"]
    var basketArr: [Character] = []
    for str in input {
      if arr.contains(str) == true { basketArr.append(str) }
    }
    
    var stack: [Character] = []

    for basket in basketArr {
      if basket == "(" || basket == "[" {
        stack.append(basket)
      } else if basket == ")" || basket == "]" {
        if stack.isEmpty {
          stack.append(basket)
          break
        }
        if basket == ")" && stack.last! == "(" {
          stack.removeLast()
        }else if basket == "]" && stack.last! == "[" {
          stack.removeLast()
        }else {
          stack.append(basket)
        }
      }
    }
    answer.append(stack.count > 0 ? "no" : "yes")
  }

  for result in answer {
    print(result)
  }
}



