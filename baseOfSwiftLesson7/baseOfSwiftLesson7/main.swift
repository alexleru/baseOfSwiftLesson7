import Foundation

//task 2 Error
//Терминал который списывает заднное кол-во средств с карты если нет проблемы
print("task 2 Error")
class cardSettings {
    let pin: Int
    var sum: Double
    let isWork: Bool
    init(pin: Int, sum: Double, isWork: Bool) {
        self.pin = pin
        self.sum = sum
        self.isWork = isWork
    }
    func withdrawSum(sumWithDraw: Double){
        self.sum -= sumWithDraw
    }
    
}

enum Problems: String, Error {
    case broken = "Невозможно прочитать карту"
    case invalidPin = "неверный ПИН"
    case notEnoghMoney = "недостаточно средств"
}

class TerminalForCard {
    
    func withdrawMoneyFromCard(pin: Int, sum: Double, card: cardSettings) -> (Double?, Problems?){
        guard card.isWork else {
            return(nil, .broken)
        }
        guard card.pin == pin else {
            return(nil, .invalidPin)
        }
        guard card.sum > sum else {
            return(nil, .notEnoghMoney)
        }
        
        card.withdrawSum(sumWithDraw: sum)
        return(sum, nil)
    }
}

var card1 = cardSettings(pin: 1111, sum: 5000, isWork: true)
var card2 = cardSettings(pin: 1112, sum: 1500, isWork: true)
var card3 = cardSettings(pin: 1113, sum: 7500, isWork: false)

var terminal = TerminalForCard()
let case1 = terminal.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card1)
print("\(case1.1?.rawValue ?? "Ошибка"). Списано \(case1.0 ?? 0.0)")
let case2 = terminal.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card2)
print("\(case2.1?.rawValue ?? "Ошибка"). Списано \(case2.0 ?? 0.0)")
let case3 = terminal.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card3)
print("\(case3.1?.rawValue ?? "Ошибка"). Списано \(case3.0 ?? 0.0)")
let case4 = terminal.withdrawMoneyFromCard(pin: 1112, sum: 500, card: card2)
print("\(case4.1?.rawValue ?? "Ошибка"). Списано \(case4.0 ?? 0.0)")


//task 1 try/catch
//Бизнес логика та же что и в task 2, но через try/catch
print("")
print("task 1 try/catch")
class TerminalForCardThrows {
    
    func withdrawMoneyFromCard(pin: Int, sum: Double, card: cardSettings) throws -> Double {
        guard card.isWork else {
           throw Problems.broken
        }
        guard card.pin == pin else {
            throw Problems.invalidPin
        }
        guard card.sum > sum else {
            throw Problems.notEnoghMoney
        }
        card.withdrawSum(sumWithDraw: sum)
        return(sum)
    }
}

var terminalThrows = TerminalForCardThrows()
do{
    let caseThrow1 = try terminalThrows.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card1)
    print("Списано \(caseThrow1)")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

do{
    let caseThrow2 = try terminalThrows.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card2)
    print("Списано \(caseThrow2)")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

do{
    let caseThrow3 = try terminalThrows.withdrawMoneyFromCard(pin: 1112, sum: 3000, card: card3)
    print("Списано \(caseThrow3)")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

do{
    let caseThrow4 = try terminalThrows.withdrawMoneyFromCard(pin: 1112, sum: 500, card: card2)
    print("Списано \(caseThrow4)")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}


