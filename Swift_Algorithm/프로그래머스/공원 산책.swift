import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
  var currentCoordinateTuple: (Int, Int) = (0, 0) //(col, row)
  
  let maxRow = park[0].count - 1
  let maxCol = park.count - 1
  let park: [[String]] = park.enumerated().map { (index, str) in
    let rowArr: [Character] = Array(str)
    if rowArr.contains("S") {
      currentCoordinateTuple.0 = index
      currentCoordinateTuple.1 = rowArr.firstIndex { $0 == "S" }!
    }
    return rowArr.map { return String($0) }
  }
  
  var targetCoordinateTuple = currentCoordinateTuple
  
  routes.forEach { str in
    let temp = str.components(separatedBy: " ")
    let direction = temp[0]
    let distance = Int(temp[1]) ?? 1
    
    for _ in 0..<distance {
      switch direction {
      case "E" :
        targetCoordinateTuple.1 += 1
      case "W" :
        targetCoordinateTuple.1 -= 1
      case "N" :
        targetCoordinateTuple.0 -= 1
      default :
        targetCoordinateTuple.0 += 1
      }
      
      if targetCoordinateTuple.0 > maxCol || targetCoordinateTuple.1 > maxRow
        || targetCoordinateTuple.0 < 0 || targetCoordinateTuple.1 < 0
        || park[targetCoordinateTuple.0][targetCoordinateTuple.1] == "X" {
        return targetCoordinateTuple = currentCoordinateTuple
      }
    }
    currentCoordinateTuple = targetCoordinateTuple
  }
  return [currentCoordinateTuple.0, currentCoordinateTuple.1]
}

