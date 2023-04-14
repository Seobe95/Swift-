import Foundation

/*
 link: https://school.programmers.co.kr/learn/courses/30/lessons/133499
*/

func solution (_ babbling: [String]) -> Int {
	let ableBabbling = ["aya", "ye", "woo", "ma"]
	
	return babbling.map { babble in
		var str = ""
		var prevBabbling = ""
		for char in babble {
			str = str + String(char)
			if ableBabbling.contains(str) && prevBabbling != str {
				prevBabbling = str
				str = ""
			} else if str == prevBabbling {
				break
			}
		}
		return str == "" ? 1 : 0
	}.reduce(0) { $0 + $1 }
}

