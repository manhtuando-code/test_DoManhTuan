import UIKit
typealias ReturnType = (VND: Int, USD: Int, EUR: Int)

var arrSotien: [(String,Int)] = [("VND",100000), ("USD",10000), ("EUR",5000),
                           ("VND",100300), ("USD",10000), ("EUR",5000),
                       ("VND",100000), ("USD",10000), ("EUR",5000),
                       ("VND",100000), ("USD",10000), ("EUR",5000)]
func TongTien(arr: [(String, Int)]) -> ReturnType {
    var USD = 0
    var VND = 0
    var EUR = 0
    for i in 0..<arr.count {
        if arr[i].0 == "VND" {
            VND += arr[i].1
        } else if arr[i].0 == "USD" {
            USD += arr[i].1
        } else {
            EUR += arr[i].1
        }
    }
    return ReturnType(VND,USD,EUR)
}

func TongTien1(arr: [(String, Int)]) {
    var money = [String:Int]()
    var USD = 0, VND = 0, EUR = 0
    for i in 0..<arr.count {
        if arr[i].0 == "VND" {
            VND += arr[i].1
        } else if arr[i].0 == "USD" {
            USD += arr[i].1
        } else {
            EUR += arr[i].1
        }
    }
    money.updateValue(VND, forKey: "VND")
    money.updateValue(USD, forKey: "USD")
    money.updateValue(EUR, forKey: "EUR")
    print(money)
}
print(TongTien(arr: arrSotien))

TongTien1(arr: arrSotien)
