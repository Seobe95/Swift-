/*
 link ; https://school.programmers.co.kr/learn/courses/30/lessons/133502
 */

import Foundation

func solution (_ ingredient: [Int]) -> Int {
	var stack = Array<Int>()
	var answer = 0
	
	for ing in ingredient {
		stack.append(ing)
		if stack.count > 3 && stack.suffix(from: stack.count - 4) == [1, 2, 3, 1] {
			answer += 1
			for _ in (stack.count - 4)...(stack.count - 1) {
				stack.removeLast()
			}
		}
	}
	return answer
}
