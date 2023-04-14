import Foundation

/*
 link: https://school.programmers.co.kr/learn/courses/30/lessons/133499
*/

func solution (_ babbling: [String]) -> Int {
	// 문제에서 주어진 가능한 옹알이 단어
	let ableBabbling = ["aya", "ye", "woo", "ma"]
	
	return babbling.map { babble in
		// 스펠링을 체크하는 str
		var str = ""
		// 이전 옹알이와 중복될 수 없어 이전 옹알이를 저장하는 변수
		var prevBabbling = ""
		// 현재 옹알이를 for문으로 분석
		for char in babble {
			str = str + String(char)
			// 가능한 옹알이에 포함되고, 이전 옹알이와 중복되지 않는다면
			if ableBabbling.contains(str) && prevBabbling != str {
				// 현재 옹알이를 이전 옹알이로
				prevBabbling = str
				// 현재 옹알이를 빈칸으로
				str = ""
			} else if str == prevBabbling {
				// 현재 옹알이와 이전 옹알이가 같다면 이 옹알이는 할 수 없는 옹알이
				break
			}
		}
		// 옹알이가 비어있으면 모두 할 수 있는 옹알이, 아니라면 할 수 없는 옹알이
		return str == "" ? 1 : 0
		// 배열을 내 모든 요소 더하기
	}.reduce(0) { $0 + $1 }
}

