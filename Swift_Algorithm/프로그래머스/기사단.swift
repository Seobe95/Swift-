import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
  let arr = getDivision(number)
  var answer = 0
  arr.forEach {
    let result = $0 > limit ? power : $0
    answer += result
  }
  return answer
}

func getDivision(_ number: Int) -> [Int] {
  var arr: [Int] = []
  
  for i in 1...number {
    var count = 0
    for j in 1...Int(sqrt(Double(i))){
      if number % j == 0{
        if (j * j) == number{
          count += 1
        }else{
          count += 2
        }
        arr.append(count)
      }
    }
  }
  return arr
}

solution(10, 3, 2)
