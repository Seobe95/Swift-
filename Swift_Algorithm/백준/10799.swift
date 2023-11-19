import Foundation

func solution() {
  let stringInput = readLine()!.replacingOccurrences(of: "()", with: "^")
  var stack: [Character] = []
  var answer = 0
  
  stringInput.forEach { item in
    if item == "(" {
      stack.append(item)
    } else if item == "^" {
      answer += stack.count
    } else {
      answer += 1
      stack.removeLast()
    }
  }
  print(answer)
}
