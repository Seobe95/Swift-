
/**
 지민이는 N개의 원소를 포함하고 있는 양방향 순환 큐를 가지고 있다. 지민이는 이 큐에서 몇 개의 원소를 뽑아내려고 한다.

 지민이는 이 큐에서 다음과 같은 3가지 연산을 수행할 수 있다.

 첫 번째 원소를 뽑아낸다. 이 연산을 수행하면, 원래 큐의 원소가 a1, ..., ak이었던 것이 a2, ..., ak와 같이 된다.
 왼쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 a2, ..., ak, a1이 된다.
 오른쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 ak, a1, ..., ak-1이 된다.
 큐에 처음에 포함되어 있던 수 N이 주어진다. 그리고 지민이가 뽑아내려고 하는 원소의 위치가 주어진다. (이 위치는 가장 처음 큐에서의 위치이다.) 이때, 그 원소를 주어진 순서대로 뽑아내는데 드는 2번, 3번 연산의 최솟값을 출력하는 프로그램을 작성하시오.
 
 첫째 줄에 큐의 크기 N과 뽑아내려고 하는 수의 개수 M이 주어진다. N은 50보다 작거나 같은 자연수이고, M은 N보다 작거나 같은 자연수이다. 둘째 줄에는 지민이가 뽑아내려고 하는 수의 위치가 순서대로 주어진다. 위치는 1보다 크거나 같고, N보다 작거나 같은 자연수이다.
 */
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var indexArr = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

class Queue {
  var arr: [Int]
  
  init(arr: [Int]) {
    self.arr = arr
  }
  
  func first() -> Int {
    return self.arr[0]
  }
  
  func moveLeft() {
    let first = arr.removeFirst()
    arr.append(first)
  }
  
  func moveRight() {
    let last = arr.removeLast()
    arr.insert(last, at: 0)
  }
  
  func shift() {
    arr.removeFirst()
  }
}

var queue = Queue(arr: Array(1...n))

var count = 0
while !indexArr.isEmpty {
  let findNumber = indexArr[0]
  let center = queue.arr.count / 2
  
  if queue.first() == findNumber {
    queue.shift()
    indexArr.removeFirst()
    continue
  } else if queue.arr.firstIndex(of: findNumber)! > center {
    queue.moveRight()
  } else if queue.arr.firstIndex(of: findNumber)! <= center {
    queue.moveLeft()
  }
  count += 1
}

print(count)


