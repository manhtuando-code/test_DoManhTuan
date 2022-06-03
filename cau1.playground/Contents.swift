import UIKit

class Account {
    var OwnerByID: Int
    init(ownerByID: Int) {
        self.OwnerByID = ownerByID
    }
}

class SavingsAccount: Account {
    var Balance: Int
    init(ownerByID: Int, balance: Int) {
        self.Balance = balance
        super.init(ownerByID: ownerByID)
    }
}

class CurrentAccount: Account {
    var Balance: Int
    init(ownerByID: Int, balance: Int) {
        self.Balance = balance
        super.init(ownerByID: ownerByID)
    }
}

class Customer {
    var Cust_ID: Int
    var Name: String
    var currentAcc: CurrentAccount
    var savingAcc: SavingsAccount
    init(Cust_ID:Int, Name: String, currentAcc: CurrentAccount, savingAcc: SavingsAccount) {
        self.Cust_ID = Cust_ID
        self.Name = Name
        self.currentAcc = currentAcc
        self.savingAcc = savingAcc
    }
    
    func totalMoney() -> Int{
        let a = currentAcc.Balance
        let b = savingAcc.Balance
//        total = a + b
        return a+b
    }
    
}

let tuan = Customer(Cust_ID: 1, Name: "tuan", currentAcc: CurrentAccount(ownerByID: 1, balance: 50000000), savingAcc: SavingsAccount(ownerByID: 1, balance: 100000000))
tuan.totalMoney()


