/*
 link : https://school.programmers.co.kr/learn/courses/30/lessons/42587
 */


import Foundation

func solution (_ priorities: [Int], _ location: Int) -> Int {
    // 기존의 대기열을 중요도, 현재의 순서를 담은 Tuple로 변환 (순서, 중요도)
    var priorities = priorities.enumerated().map { ($0, $1) }
    var count = 0
    
    // while은 특정 분기에 따라 끝내기 -> 현재 순서와 location이 같을 경우 break
    while true {
        // 현재 남은 대기열 중 가장 높은 중요도를 구한다
        let importance = priorities.max { a, b in
            a.1 < b.1
        }!.1
        
        // 현재 가장 앞순서의 출력물(?)을 뽑아냄
        let currentPriority = priorities.removeFirst()
        // 뽑은 출력물의 중요도와 현재 남은 출력물들 중 가장 높은 중요도를 비교
        if currentPriority.1 == importance {
            //같은 경우 출력횟수 +1
            count += 1
            if currentPriority.0 == location {
                // 여기에 찾고인는 순서와 같은 경우 while을 벗어남
                break
            }
        } else {
            // 중요도보다 낮은 출력물인 경우 대기열의 맨 뒤로 보낸다.
            priorities.append(currentPriority)
        }
    }
    return count
}

