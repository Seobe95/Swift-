import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var money = money
    for repeating in 1...count {
        money = money - price * repeating
    }
    
    return money >= 0 ? 0 : Int64(money * -1)
}
