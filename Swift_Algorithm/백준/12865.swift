import Foundation

func solution() {
  let (n, k) = convertReadlineToTuple()
  var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k+1), count: n)
  for i in 0..<n {
    let (weight, value) = convertReadlineToTuple()
    
    for j in 1...k {
      if i == 0 {
        if j >= weight {
          dp[i][j] = value
        }
      } else {
        if j < weight {
          dp[i][j] = dp[i-1][j]
        }else {
          dp[i][j] = max(dp[i-1][j], value + dp[i-1][j-weight])
        }
      }
    }
  }
  
  print(dp.map { $0.max()! }.max()!)
}

func convertReadlineToTuple() -> (Int, Int) {
  let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
  return (input[0], input[1])
}

solution()
