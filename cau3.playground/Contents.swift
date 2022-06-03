import UIKit
import Foundation

class Person {
    var name: String
    var age: Int
    var money: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

protocol LenderBehavior {
    func lendMoney(borrower: BorrowerBehavior, money: Int) -> Bool
    func requestPayment()
}

protocol BorrowerBehavior {
    func askForMoney(lender: LenderBehavior, money: Int)
    func recieveMoney(lender: LenderBehavior, money: Int)
    func payMoneyBack() -> Int?
}

class Lender: Person, LenderBehavior {
    var borrower: BorrowerBehavior?
    
    func lendMoney(borrower: BorrowerBehavior, money: Int) -> Bool {
        //k đủ thì k cho vay
        guard self.money >= money else {return false}
        self.borrower = borrower
        self.money -= money
        //đưa tiền cho ng vay
        borrower.recieveMoney(lender: self ,money: money)
        return true
    }
    
    // đòi tiền
    func requestPayment(){
        if let borrower = self.borrower {
            if let returnMoney = borrower.payMoneyBack() {
                self.money += returnMoney
                self.borrower = nil
            } else {
                print("Đi đòi nợ bằng biện pháp mạnh")
            }
        }
    }
}

class Borrower: Person, BorrowerBehavior {
    var lender: LenderBehavior?
    var debt: Int = 0
    
    func askForMoney(lender: LenderBehavior, money: Int) {
        if lender.lendMoney(borrower: self, money: money) {
            print("tạ ơn trời đã có ng cho vay")
        } else {
            print("thank you, next!")
        }
    }
    
    func recieveMoney(lender: LenderBehavior, money: Int) {
        self.lender = lender
        debt = money
        self.money += money
    }
    
    func payMoneyBack() -> Int? {
        var returnMoney: Int?
        
        if money >= debt {
            money -= debt
            returnMoney = debt
            debt = 0
            self.lender = nil
        } else {
            print("hẹn lần bạn lần sau")
            return nil
        }
        return returnMoney
    }
}


let lenderObj = Lender(name: "Thơ", age: 22)
lenderObj.money = 1000000000

let borrowerObj = Borrower(name: "Tuấn", age: 22)

borrowerObj.askForMoney(lender: lenderObj, money: 50000000)

lenderObj.lendMoney(borrower: borrowerObj, money: 50000000)

lenderObj.requestPayment()
