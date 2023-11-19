//
//  main.swift
//  Swift_Algorithm
//
//  Created by seobe22 on 10/25/23.
//

import Foundation

/*
 a를 주면 b개의 콜라를 주는 매장이 있음
 a로 나누어 떨어지는 수만큼을 나누고, 돌려받는 콜라의 수를 합하면 된다.
 a: 가져가야 하는 빈 병의 개수
 b: a개 만큼의 병을 주면 받는 콜라의 수
 n: 현재 가지고 있는 콜라의 개수
 */

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
  var totalCoke = n
  var answer = 0
  
  while totalCoke >= a {
    let emptyBottle = totalCoke / a
    let restCoke = totalCoke % a
    let newCoke = emptyBottle * b
    
    answer += newCoke
    totalCoke = emptyBottle == newCoke ? emptyBottle + restCoke : newCoke + restCoke
  }
  
  return answer
}

print(solution(5, 3, 21))
