import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
  var answer: [Int] = []
  let todayArr = today.components(separatedBy: ".").map { return Int($0)! }
  let todays = getDays((todayArr[0], todayArr[1], todayArr[2]))
  var termDictionary: [String : Int] = [:]
  
  for term in terms {
    let temp = term.components(separatedBy: " ")
    let deadline = temp[1]
    let termTypes = temp[0]
    
    termDictionary[termTypes] = Int(deadline)!
  }
  
  for (index, item) in privacies.enumerated() {
    let temp = item.components(separatedBy: " ")
    let month = termDictionary[temp[1]]!
    let deadline = temp[0].components(separatedBy: ".").map { return Int($0)! }
    
    let deadlineDays = getDays((deadline[0], deadline[1] + month, deadline[2]))
    
    if todays >= deadlineDays {
      answer.append(index + 1)
    }
  }
  
  return answer
}

func getDays(_ date: (Int, Int, Int)) -> Int {
  let days = date.0 * 12 * 28 + date.1 * 28 + date.2
  return days
}
