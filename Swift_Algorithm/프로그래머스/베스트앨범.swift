import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
  var musicDictionary: [String : (play: Int, songInfo: [(play: Int, id: Int)])] = [:]
  var answer: [Int] = []
  for i in 0..<genres.count {
    if let value = musicDictionary[genres[i]] {
      let songPlay = value.play + plays[i]
      let newInfo = value.songInfo + [(plays[i], i)]
      
      musicDictionary[genres[i]] = (songPlay, newInfo)
    } else {
      musicDictionary[genres[i]] = (plays[i], [(plays[i], i)])
    }
  }
  
  let newArr = musicDictionary.values.sorted { $0.play > $1.play }.map {$0.songInfo}

  newArr.forEach {
    if $0.count >= 2 {
      let sorted = $0.sorted{ $0.play > $1.play}[0...1]
      if sorted[0].play  == sorted[1].play {
        answer += sorted[0].id < sorted[1].id ? [sorted[0].id, sorted[1].id] : [sorted[1].id, sorted[0].id]
      } else {
        answer += [sorted[0].id, sorted[1].id]
      }
    } else {
      answer += [$0[0].id]
    }
  }
  return answer
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
